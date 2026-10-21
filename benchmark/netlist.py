"""Minimal SPICE netlist parsing: enough to find every transistor in a (hierarchical) netlist.

Used to (a) print each transistor's operating point (headroom / saturation check) and
(b) rewrite 180 nm transistors as Sky130 ones in the naive port.
"""
import re

from sim import ascii_lower

SKY130_FET = re.compile(r"^sky130_fd_pr__[np]fet\w*$", re.I)


def logical_lines(text):
    """Strip comments and join '+' continuation lines."""
    out = []
    for raw in text.splitlines():
        s = raw.split(";")[0].rstrip()
        if not s.strip() or s.lstrip().startswith("*"):
            continue
        if s.lstrip().startswith("+") and out:
            out[-1] += " " + s.lstrip()[1:]
        else:
            out.append(s.strip())
    return out


def mos_type(model):
    m = model.lower()
    return "p" if ("pfet" in m or "pmos" in m or m.endswith("dp")) else "n"


def subckt_name(tokens):
    """Subcircuit name of an X line: the last token that is not a parameter assignment."""
    return [t for t in tokens[1:] if "=" not in t][-1]


GLOBAL_NODES = {"0", "vdd", "gnd"}


def mos_devices(text):
    """Return [(ngspice device name, 'n'|'p', bulk node, drain node)] for every MOSFET, expanding subcircuits.

    180 nm devices are `M` lines (ngspice name m.<xpath>.<mname>); Sky130 devices are `X` lines that
    call a sky130_fd_pr__*fet* subcircuit (ngspice name m.<xpath>.<xname>.m<model>).
    The bulk node is the name written on the device line; the drain node is resolved through the
    subcircuit ports to the top-level (testbench) net name, or <xpath>.<name> for internal nets.
    """
    subckts, ports, cur, top = {}, {}, None, []
    for line in logical_lines(text):
        t = line.split()
        key = ascii_lower(t[0])
        if key == ".subckt":
            cur = ascii_lower(t[1])
            subckts[cur] = []
            ports[cur] = [ascii_lower(x) for x in t[2:] if "=" not in x]
        elif key == ".ends":
            cur = None
        elif cur is not None:
            subckts[cur].append(t)
        elif key[0] in "mx":
            top.append(t)

    def walk(lines, prefix, nodemap):
        res = lambda n: ascii_lower(n) if ascii_lower(n) in GLOBAL_NODES else nodemap.get(ascii_lower(n), prefix + ascii_lower(n))
        for t in lines:
            name = ascii_lower(t[0])
            if name[0] == "m":
                path = prefix + name
                yield ("m." + path if prefix else path), mos_type(t[5]), t[4], res(t[1])
            elif name[0] == "x":
                sub = ascii_lower(subckt_name(t))
                if sub in subckts:
                    conns = [x for x in t[1:] if "=" not in x][:-1]
                    yield from walk(subckts[sub], prefix + name + ".",
                                    {p: res(c) for p, c in zip(ports[sub], conns)})
                elif SKY130_FET.match(sub):
                    yield f"m.{prefix}{name}.m{sub}", mos_type(sub), t[4], res(t[1])

    return list(walk(top, "", {}))


def op_print_lines(devices, fname="op_devices.txt"):
    """ngspice control lines that write id/vds/vdsat/vgs/vth of each device to `fname`."""
    lines = []
    for i, (dev, *_) in enumerate(devices):
        vecs = " ".join(f"@{dev}[{p}]" for p in ("id", "vgs", "vds", "vdsat", "vth"))
        lines.append(f"print {vecs} {'>' if i == 0 else '>>'} {fname}")
    return "\n".join(lines)
