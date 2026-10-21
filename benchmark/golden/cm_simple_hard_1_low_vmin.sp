* cm_simple, hard spec point H1 (ultra-low compliance): circuits/cm_simple/profiles/hard_1_low_vmin.yaml
* Topology (change): self-biased low-voltage cascode mirror, all devices in weak inversion (W/L = 200 bottom,
*   800 cascode, Vgs ~ 0.39-0.41 V), output side deliberately 8 % wider than the reference (W = 108 vs 100).
*   R1 lifts the cascode gate by Iref*R1 = 0.17 V so the bottom devices sit at Vds ~ 0.155 V (~6 Ut).
* Why: Vmin is the Vo where Iout reaches 95 % of Iref. A simple mirror rises with Vo (Sky130 LVT in weak
*   inversion: gds/Id ~ 1/8 V^-1), so its current near the knee is ~10 % below its 0.9 V value and the error
*   budget is spent on slope. The cascode makes Iout flat, so the +8 % ratio can be spent on compliance: 95 % of
*   Iref is only 88 % of the flat current, reached at ~2.1 Ut. Weak inversion gives the sharpest knee
*   (1 - exp(-Vds/Ut)). The bound for this error is 54.5 mV; the design sits on it.
* One simulation per change, no automated search (simple mirror in WI: 0.117-0.119 V; with lowered reference
*   Vds 0.075-0.087 V at 9-12 % error; unskewed WI LV cascode 0.079 V; this skewed one 0.054 V).
* Sky130 1.8 V LVT, VDD = 1.2 V, Iref = 20 uA into 'in', bulks at 0, 'in' only on drains/gates.
* Results (iout_err %, Rout kOhm, Vmin V, n_triode, min saturation margin V at Vo = 0.9 V):
*   tt 8.17 18399 0.054 0 0.106 | ff 8.17 18605 0.054 0 0.108 | ss 8.18 18198 0.054 0 0.105
*   sf 8.17 18832 0.054 0 0.108 | fs 8.17 17970 0.054 0 0.104      -> passes at tt ff ss sf fs (27 C)
.subckt dut in out
R1 in nb 8.5k
XM3 nb in nc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=8
XM1 nc nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XM4 out in nd 0 sky130_fd_pr__nfet_01v8_lvt W=108 L=1 nf=1 m=8
XM2 nd nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=108 L=4 nf=1 m=8
.ends dut
