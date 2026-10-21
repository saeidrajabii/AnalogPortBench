"""Extract the netlist from a model reply and check it before it is simulated.

Two levels of problems:
  unsafe      never simulated: ngspice control blocks can run shell commands, and include/lib
              statements can read arbitrary files (.control, .endc, .include, .inc, .lib, .exec)
  violations  simulated anyway (to keep the information), but the run counts as FAIL:
              anything the prompt forbids or that changes the testbench (sources, analysis or
              option statements, .model, other devices, sizes below minimum (W/nf for fingers), nf other than 1, unit suffixes on W/L,
              overriding testbench parameters, extra .global nets, wrong dut ports)
A bare `.end` line is removed (harmless, but it would cut off the testbench) and noted. Non-ASCII
characters (e.g. a Greek capital Nu that looks like N) are replaced by ASCII codes, consistently, and noted.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from netlist import logical_lines, subckt_name   # noqa: E402

CODE_BLOCK = re.compile(r"```[ \t]*([A-Za-z0-9_+-]*)[ \t]*\n(.*?)```", re.S)
UNSAFE = re.compile(r"^\s*(\.control|\.endc|\.include|\.inc|\.lib|\.exec)\b", re.I | re.M)
ALLOWED_DOT = {".subckt", ".ends", ".param", ".global"}
TB_PARAMS = {"vdd", "iref", "vcm", "cl", "vstep", "t", "td", "tr"}
LVT = {"sky130_fd_pr__nfet_01v8_lvt": 0.15, "sky130_fd_pr__pfet_01v8_lvt": 0.35}
WMIN = 0.42


def extract(reply):
    """Return (netlist or None, info). Picks the first code block that defines `.subckt dut`."""
    blocks = CODE_BLOCK.findall(reply or "")
    info = {"n_code_blocks": len(blocks)}
    for lang, body in blocks:
        if re.search(r"^\s*\.subckt\s+dut\b", body, re.I | re.M):
            info["block_language"] = lang
            return body, info
    return None, info


def check(netlist, ports):
    """Return (cleaned netlist, unsafe list, violations list, notes list)."""
    notes, violations = [], []
    lines = netlist.splitlines()
    kept = [l for l in lines if l.strip().lower() != ".end"]
    if len(kept) != len(lines):
        notes.append("removed '.end' line")
    cleaned = "\n".join(kept) + "\n"
    # ngspice cannot address devices whose names contain non-ASCII characters (it mangles them internally).
    # Replace every such character consistently (same character -> same code), which keeps connectivity.
    odd = sorted({c for c in cleaned if ord(c) > 127})
    if odd:
        cleaned = "".join(f"U{ord(c):04X}" if ord(c) > 127 else c for c in cleaned)
        notes.append("replaced non-ASCII characters " + ", ".join(f"'{c}' (U+{ord(c):04X})" for c in odd))
    unsafe = sorted({m.group(1).lower() for m in UNSAFE.finditer(cleaned)})

    defined = {l.split()[1].lower() for l in logical_lines(cleaned) if l.lower().startswith(".subckt")}
    for line in logical_lines(cleaned):
        t = line.split()
        key = t[0].lower()
        if key.startswith("."):
            if key not in ALLOWED_DOT and f"{key} statement" not in violations:
                violations.append(f"{key} statement")
            if key == ".subckt" and t[1].lower() == "dut":
                got = [x for x in t[2:] if "=" not in x]
                if [x.lower() for x in got] != ports.split():
                    violations.append(f"dut ports are '{' '.join(got)}', expected '{ports}'")
            if key == ".param":
                for name in re.findall(r"(\w+)\s*=", line):
                    if name.lower() in TB_PARAMS:
                        violations.append(f".param redefines testbench parameter '{name}'")
            if key == ".global":
                extra = [n for n in t[1:] if n.lower() not in ("vdd", "0")]
                if extra:
                    violations.append(f".global adds nets {extra}")
        elif key[0] == "x":
            sub = subckt_name(t).lower()
            if sub in LVT:
                p = {k.lower(): v for k, v in re.findall(r"(\w+)\s*=\s*(\S+)", line)}
                nf = p.get("nf", "1")
                if nf not in ("1", "1.0"):
                    violations.append(f"{t[0]}: nf={nf}; the prompt requires nf=1")
                nf = float(nf) if re.fullmatch(r"[\d.]+", nf) else 1.0
                for dim, lo in (("l", LVT[sub]), ("w", WMIN * nf)):     # W is total width: W/nf >= WMIN
                    v = p.get(dim)
                    if v is None:
                        violations.append(f"{t[0]}: {dim.upper()} not given")
                    elif not re.fullmatch(r"[\d.]+(e[-+]?\d+)?", v, re.I):
                        violations.append(f"{t[0]}: {dim.upper()}={v} is not a plain number in um")
                    elif float(v) < lo - 1e-9:
                        violations.append(f"{t[0]}: {dim.upper()}={v} below minimum {lo:g}"
                                          + (f" (W/nf >= {WMIN} with nf={nf:g})" if dim == "w" and nf > 1 else ""))
            elif sub not in defined:
                violations.append(f"{t[0]}: unknown subcircuit or device '{sub}'")
        elif key[0] not in "rc":
            violations.append(f"{t[0]}: element type '{key[0].upper()}' not allowed")
    if "dut" not in defined:
        violations.append("no .subckt dut")
    return cleaned, unsafe, violations, notes


# ---------------------------------------------------------------------------------------------------------------
# Benchmark rules for prompt v2 tasks (not applied to the frozen v1 runs). They close two testbench loopholes:
#   1. the ideal reference current (port iref / iin / in) must be mirrored: it may not be the SOURCE of a transistor
#      (that would use it directly as a tail/bias current with no compliance limit);
#   2. no element may connect `inp` directly to `out` (feed-forward from the input to the output).
REF_PORTS = ("iref", "iin", "in")


def benchmark_rules(netlist, ports):
    subs, cur = {}, None
    for line in logical_lines(netlist):
        t = line.split()
        k = t[0].lower()
        if k == ".subckt":
            cur = t[1].lower()
            subs[cur] = ([x.lower() for x in t[2:] if "=" not in x], [])
        elif k == ".ends":
            cur = None
        elif cur:
            subs[cur][1].append(t)
    if "dut" not in subs:
        return []
    top = {p: p for p in subs["dut"][0]}
    ref = [p for p in REF_PORTS if p in subs["dut"][0]]
    viol = []

    def walk(name, nmap, depth=0):
        if depth > 20:
            return
        for t in subs[name][1]:
            r = lambda n: nmap.get(n.lower(), f"{name}:{n.lower()}") if n.lower() not in ("0", "vdd") else n.lower()
            k = t[0][0].lower()
            if k == "x":
                sub = subckt_name(t).lower()
                conns = [x for x in t[1:] if "=" not in x][:-1]
                if sub in subs:
                    walk(sub, {p: r(c) for p, c in zip(subs[sub][0], conns)}, depth + 1)
                elif "fet" in sub and len(conns) >= 4 and r(conns[2]) in ref:
                    viol.append(f"reference current used directly as the source of {t[0]} (must be mirrored)")
            elif k == "m" and len(t) > 4 and r(t[3]) in ref:
                viol.append(f"reference current used directly as the source of {t[0]} (must be mirrored)")
            if k in "rclx" and "inp" in top and "out" in top:
                nodes = {r(x) for x in [x for x in t[1:] if "=" not in x][:2 if k in "rcl" else None]}
                if k in "rcl" and {"inp", "out"} <= nodes:
                    viol.append(f"{t[0]} connects inp directly to out (feed-forward not allowed)")

    walk("dut", top)
    return sorted(set(viol))
