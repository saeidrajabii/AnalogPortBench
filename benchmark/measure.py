"""Metric extraction for each testbench template.

Definitions follow ngspice-180n-testbenches/analyze.py so that the 180 nm source designs give the
same numbers as the committed results.json. Every function takes the run folder, the testbench
parameters and VDD, and returns a flat {metric: value} dict (units are in the key names).
"""
from pathlib import Path

import numpy as np

from sim import load_wrdata, read_print, xcross


def _power_uW(run_dir, vdd):
    op = read_print(Path(run_dir) / "op_nodes.txt")
    return round(-op["vsup#branch"] * vdd * 1e6, 2)


def mirror_dc(run_dir, p, vdd):
    d = load_wrdata(Path(run_dir) / "dc_sweep.txt")
    vo, io = d["v-sweep"], -d["i(vo)"] * 1e6            # output current in uA
    iref = p["IREF_uA"]
    i9 = float(np.interp(0.9, vo, io))
    g = float(np.interp(0.9, vo, np.gradient(io * 1e-6, vo)))
    vmin = xcross(vo, io, 0.95 * iref)                    # compliance: Iout reaches 95 % of Iref
    return {"iout_0v9_uA": round(i9, 3), "iout_vdd_uA": round(float(io[-1]), 3),
            "iout_err_pct": round(100 * (i9 - iref) / iref, 2),
            "rout_kohm": round(1 / g / 1e3, 1) if g > 0 else None,
            "vmin_V": round(vmin, 3) if vmin is not None else None}


def cascode_bias_dc(run_dir, p, vdd):
    d = load_wrdata(Path(run_dir) / "dc_sweep.txt")
    vo, i = d["v-sweep"], d["i(vo)"] * 1e6               # PMOS source minus NMOS sink, uA
    op = read_print(Path(run_dir) / "op_nodes.txt")
    out = {f"vb{n}_V": round(op[f"vb{n}"], 4) for n in range(1, 5)}
    out["mismatch_0v9_nA"] = round(float(np.interp(0.9, vo, i)) * 1e3, 1)
    ok = np.abs(i) < 1.0
    lo, hi = (float(vo[ok].min()), float(vo[ok].max())) if ok.any() else (None, None)
    out.update({"match_lo_V": lo, "match_hi_V": hi,
                "match_width_V": round(hi - lo, 3) if ok.any() else 0.0})
    return out


def _input_current_uA(op):
    """Largest DC current drawn from the testbench's input sources (VCMS, VIN; the loop probe VPRB_A feeds inn)."""
    return round(max(abs(op.get(k, 0.0)) for k in ("vcms#branch", "vin#branch", "vprb_a#branch")) * 1e6, 4)


def _pm_relative(f, ph, fu):
    """Phase margin measured from the DC phase. A non-inverting amplifier has a DC phase near 0 and gets the usual
    180 + phase(fu); an amplifier whose output is inverted (DC phase near +-180) has no valid phase margin (None),
    so it cannot pass a PM limit by reading 360 - lag."""
    ph0 = float(ph[0])
    if abs(((ph0 + 180) % 360) - 180) > 90:
        return None
    return round(180 + float(np.interp(fu, f, ph)) - ph0, 1)


def ota_ol_ac(run_dir, p, vdd):
    d = load_wrdata(Path(run_dir) / "ac.txt", complex_=True)
    f, h = d["frequency"], d["v(nout)"]
    mag = 20 * np.log10(np.abs(h))
    ph = np.degrees(np.unwrap(np.angle(h)))
    a0 = float(mag[0])
    f3, ugb = xcross(f, mag, a0 - 3), xcross(f, mag, 0)
    op = read_print(Path(run_dir) / "op_nodes.txt")
    return {"dc_gain_dB": round(a0, 2), "f3db_Hz": f3, "ugb_Hz": ugb,
            "pm_deg": _pm_relative(f, ph, ugb) if ugb else None,
            "vout_dc_V": round(op["nout"], 4), "power_uW": _power_uW(run_dir, vdd),
            "input_current_uA": _input_current_uA(op)}


def opamp_loop(run_dir, p, vdd):
    d = load_wrdata(Path(run_dir) / "stb.txt")
    f, lg, lp = d["frequency"], d["lg_db"], d["lg_ph"]
    ugf = xcross(f, lg, 0)
    pm = _pm_relative(f, lp, ugf) if ugf else None
    f180 = xcross(f, lp - float(lp[0]), -180) if pm is not None else None   # -180 deg relative to the DC phase
    op = read_print(Path(run_dir) / "op_nodes.txt")
    return {"dc_gain_dB": round(float(lg[0]), 2), "ugf_Hz": ugf, "pm_deg": pm,
            "gm_dB": round(-float(np.interp(f180, f, lg)), 1) if f180 else None,
            "power_uW": _power_uW(run_dir, vdd), "input_current_uA": _input_current_uA(op)}


def opamp_tran(run_dir, p, vdd):
    d = load_wrdata(Path(run_dir) / "tran.txt")
    t, vo = d["time"] * 1e9, d["v(nout)"]
    lo, hi = p["VCM"] - p["VSTEP"] / 2, p["VCM"] + p["VSTEP"] / 2

    def edge(t0, t1, v0, v1):
        m = (t >= t0) & (t <= t1)
        tt, yy = t[m], vo[m]
        step = v1 - v0
        t10, t90 = xcross(tt, yy, v0 + 0.1 * step), xcross(tt, yy, v0 + 0.9 * step)
        final = yy[-1]
        ov = ((yy.max() - final) if step > 0 else (final - yy.min())) / abs(step) * 100
        outside = np.where(np.abs(yy - final) > 0.01 * abs(step))[0]
        if not len(outside):
            ts = 0.0
        else:      # None = still outside the 1 % band at the end of the window (never settled)
            ts = tt[outside[-1] + 1] - t0 if outside[-1] + 1 < len(tt) else None
        sr = 0.8 * abs(step) / ((t90 - t10) * 1e-9) / 1e6 if t10 and t90 and t90 > t10 else None
        return ts, ov, sr

    rs, ro, rsr = edge(5, 55, lo, hi)
    fs, fo, fsr = edge(55, 105, hi, lo)
    r = lambda x, n: round(float(x), n) if x is not None else None
    return {"rise_settle_ns": r(rs, 2), "rise_overshoot_pct": r(ro, 2), "rise_slew_V_per_us": r(rsr, 1),
            "fall_settle_ns": r(fs, 2), "fall_overshoot_pct": r(fo, 2), "fall_slew_V_per_us": r(fsr, 1)}


def ota_swing_dc(run_dir, p, vdd):
    d = load_wrdata(Path(run_dir) / "swing.txt")
    vid, vo = d[next(iter(d))], d["v(nout)"]      # first column = swept input
    g = np.gradient(vo, vid)
    k = int(np.argmax(g))
    ok = g >= 0.5 * g[k]                     # within 6 dB of the peak gain
    lo, hi = k, k
    while lo > 0 and ok[lo - 1]:
        lo -= 1
    while hi < len(ok) - 1 and ok[hi + 1]:
        hi += 1
    return {"swing_V": round(float(vo[hi] - vo[lo]), 3), "swing_lo_V": round(float(vo[lo]), 3),
            "swing_hi_V": round(float(vo[hi]), 3)}


MEASURE = {"mirror_dc": mirror_dc, "cascode_bias_dc": cascode_bias_dc, "ota_ol_ac": ota_ol_ac,
           "opamp_loop": opamp_loop, "opamp_tran": opamp_tran, "ota_swing_dc": ota_swing_dc}


def headroom(run_dir, devices):
    """Saturation check at the operating point: margin = |Vds| - |Vdsat| for every transistor."""
    v = read_print(Path(run_dir) / "op_devices.txt")
    rows = []
    for dev, typ, bulk, drain in devices:
        g = lambda k: abs(v[f"@{dev}[{k}]"])
        rows.append({"device": dev, "type": typ, "drain": drain, "id_uA": round(g("id") * 1e6, 3),
                     "vgs_V": round(g("vgs"), 3),
                     "vds_V": round(g("vds"), 3), "vdsat_V": round(g("vdsat"), 3),
                     "margin_V": round(g("vds") - g("vdsat"), 3)})
    triode = [r["device"] for r in rows if r["margin_V"] < 0]
    return {"n_triode": len(triode), "min_sat_margin_V": min(r["margin_V"] for r in rows),
            "triode_devices": triode, "devices": rows}


def branch_currents(head, node, iref_uA):
    """Current error of the NMOS sink and PMOS source whose drains sit on testbench net `node`.

    Sums the operating-point drain currents of all n (sink) and p (source) transistors with their drain
    on that net; returns errors relative to Iref in % (None if there is no such transistor).
    """
    out = {}
    for typ, key in (("n", "isink_err_pct"), ("p", "isource_err_pct")):
        ids = [r["id_uA"] for r in head["devices"] if r["type"] == typ and r["drain"] == node]
        out[key] = round(100 * (sum(ids) - iref_uA) / iref_uA, 2) if ids else None
    return out

