#!/usr/bin/env bash
# Create the conda env and install a pinned Sky130 PDK (outside the repo).
#   bash scripts/setup_env.sh
# Env vars: PDK_ROOT (default ~/.ciel), CONDA_ENV (default analog-port)
set -euo pipefail
OPEN_PDKS_HASH=f6eeac7dad085ffcc829ccfd721f7b4ce39edcf7   # pinned open_pdks build (2026-07-14); must ship sky130_fd_pr
CONDA_ENV=${CONDA_ENV:-analog-port}
export PDK_ROOT=${PDK_ROOT:-$HOME/.ciel}
REPO=$(cd "$(dirname "$0")/.." && pwd)

if ! conda env list | grep -q "^$CONDA_ENV "; then
  conda env create -f "$REPO/environment.yml" -n "$CONDA_ENV"
fi
BIN="$(conda env list | awk -v e="$CONDA_ENV" '$1==e{print $NF}')/bin"
"$BIN/ciel" enable --pdk-root "$PDK_ROOT" --pdk-family sky130 -l sky130_fd_pr "$OPEN_PDKS_HASH"   # sky130_fd_pr = device models

echo "ngspice : $("$BIN/ngspice" --version | grep -m1 ngspice)"
echo "PDK_ROOT: $PDK_ROOT  (open_pdks $OPEN_PDKS_HASH)"
echo "Sky130 ngspice lib: $(ls "$PDK_ROOT"/sky130A/libs.tech/combined/sky130.lib.spice 2>/dev/null || ls "$PDK_ROOT"/sky130A/libs.tech/ngspice/sky130.lib.spice)"
