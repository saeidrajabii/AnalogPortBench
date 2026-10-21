"""Small helpers to run ngspice in batch mode and read its output files."""
import re
import subprocess
from pathlib import Path

import numpy as np

import config


def ascii_lower(s):
    """Lower-case like ngspice does: only ASCII A-Z (non-ASCII characters in names are kept as they are)."""
    return "".join(c.lower() if "A" <= c <= "Z" else c for c in s)


class SimError(RuntimeError):
    pass


def run_ngspice(netlist, run_dir, name="tb", spiceinit=None, timeout=900):
    """Write `netlist` to run_dir/name.cir, run `ngspice -b` there, return the log text.

    Raises SimError if ngspice exits non-zero or prints an 'Error' line.
    `spiceinit` (text) is written to run_dir/.spiceinit, which ngspice reads at start-up.
    """
    run_dir = Path(run_dir)
    run_dir.mkdir(parents=True, exist_ok=True)
    if spiceinit:
        (run_dir / ".spiceinit").write_text(spiceinit)
    (run_dir / f"{name}.cir").write_text(netlist)
    p = subprocess.run([config.ngspice(), "-b", f"{name}.cir"], cwd=run_dir,
                       capture_output=True, text=True, timeout=timeout)
    log = p.stdout + p.stderr
    (run_dir / f"{name}.log").write_text(log)
    errors = [l for l in log.splitlines() if re.match(r"\s*error", l, re.I)]
    if p.returncode != 0 or errors:
        raise SimError(f"ngspice failed in {run_dir} (rc={p.returncode}):\n" + "\n".join(errors[:10]))
    return log


def load_wrdata(path, complex_=False):
    """Read a file written by `wrdata` with wr_singlescale + wr_vecnames.

    Returns {lower-case vector name: numpy array}. The first column is the scale (sweep, time or frequency).
    For AC data each vector is stored as (re, im) column pairs; set complex_=True.
    """
    with open(path) as f:
        hdr = f.readline().lower().split()
    d = np.loadtxt(path, skiprows=1, ndmin=2)
    out = {}
    if complex_:
        out["frequency"] = d[:, 0]
        for i in range(1, len(hdr) - 1, 2):
            out.setdefault(hdr[i], d[:, i] + 1j * d[:, i + 1])
    else:
        for i, h in enumerate(hdr):
            out.setdefault(h, d[:, i])
    return out


def read_print(path):
    """Parse `print a b c > file` output (lines like 'name = value') into {name: float}."""
    vals = {}
    for name, v in re.findall(r"^\s*(\S+)\s*=\s*(\S+)", Path(path).read_text(), re.M):
        try:
            vals[ascii_lower(name)] = float(v)
        except ValueError:
            pass
    return vals


def xcross(x, y, level):
    """First x where y crosses `level` (linear interpolation), or None."""
    s = np.sign(np.asarray(y) - level)
    idx = np.where(np.diff(s) != 0)[0]
    if not len(idx):
        return None
    i = idx[0]
    return float(x[i] + (level - y[i]) * (x[i + 1] - x[i]) / (y[i + 1] - y[i]))
