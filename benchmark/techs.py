"""Technology descriptions: how to include models and how to write a transistor instance.

Sizes inside the benchmark are always in micrometres (W, L). Each technology turns a
generic transistor (name, d, g, s, b, type 'n'/'p', W, L, m) into its own netlist line.
"""
import config

SKY130_SPICEINIT = "set ngbehavior=hsa\nset ng_nomodcheck\n"


def _tsmc_line(name, d, g, s, b, typ, w, l, m=1):
    # 180 nm convention used by the converted testbenches: as/ad = W*0.45um, ps/pd = 2*(W+0.45um)
    model = "tsmc18dN" if typ == "n" else "tsmc18dP"
    name = name if name.upper().startswith("M") else "M" + name
    a, p = w * 0.45, 2 * (w + 0.45)
    return (f"{name} {d} {g} {s} {b} {model} w={w:g}u l={l:g}u "
            f"as={a:g}p ad={a:g}p ps={p:g}u pd={p:g}u m={m:g}")


def _sky130_line(name, d, g, s, b, typ, w, l, m=1):
    # Sky130 models use `.option scale=1u`: W and L are written in um without a suffix.
    # Diffusion area/perimeter follow the usual xschem convention for nf=1 (0.29 um diffusion).
    model = f"sky130_fd_pr__{'n' if typ == 'n' else 'p'}fet_01v8_lvt"
    a, p = w * 0.29, 2 * (w + 0.29)
    return (f"X{name} {d} {g} {s} {b} {model} W={w:g} L={l:g} nf=1 "
            f"ad={a:g} as={a:g} pd={p:g} ps={p:g} m={m:g}")


TECHS = {
    "tsmc018": {
        "header": lambda corner="tt": f'.lib "{config.TSMC018_LIB}" {corner}',
        "line": _tsmc_line,
        "lmin": {"n": 0.18, "p": 0.18},
        "vdd": 1.8,
        "spiceinit": None,
    },
    "sky130_lvt": {
        "header": lambda corner="tt": f'.lib "{config.sky130_lib()}" {corner}',
        "line": _sky130_line,
        "lmin": {"n": 0.15, "p": 0.35},
        "vdd": 1.8,
        "spiceinit": SKY130_SPICEINIT,
    },
}
