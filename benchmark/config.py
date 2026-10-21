"""Paths and tool locations for the benchmark, in one place.

Everything can be overridden with environment variables:
  TSMC018_LIB  path to the (confidential, never committed) 180 nm ngspice library
               default: <repo>/tsmc018_ngspice.lib
  PDK_ROOT     ciel/volare PDK root holding sky130A            default: ~/.ciel
  NGSPICE      ngspice executable    default: ngspice on PATH, else the analog-port conda env
"""
import os
import shutil
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
BENCH = REPO / "benchmark"
BUILD = REPO / "build"                      # all simulation output goes here (git-ignored)
SRC_180N = REPO / "ngspice-180n-testbenches"

TSMC018_LIB = Path(os.environ.get("TSMC018_LIB", REPO / "tsmc018_ngspice.lib")).resolve()
PDK_ROOT = Path(os.environ.get("PDK_ROOT", Path.home() / ".ciel"))


def sky130_lib():
    """Sky130 ngspice model library (the 'combined' continuous models, if present)."""
    for sub in ("combined", "ngspice"):
        p = PDK_ROOT / "sky130A" / "libs.tech" / sub / "sky130.lib.spice"
        if p.exists():
            return p.resolve()
    raise FileNotFoundError(f"sky130.lib.spice not found under {PDK_ROOT}/sky130A; run scripts/setup_env.sh")


def ngspice():
    exe = os.environ.get("NGSPICE") or shutil.which("ngspice")
    if not exe:
        cand = Path.home() / "miniconda3" / "envs" / "analog-port" / "bin" / "ngspice"
        exe = str(cand) if cand.exists() else None
    if not exe:
        raise FileNotFoundError("ngspice not found; activate the analog-port env or set NGSPICE")
    return exe
