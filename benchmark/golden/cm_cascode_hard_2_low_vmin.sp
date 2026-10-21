* cm_cascode, hard spec point H2 (accurate copy at very low compliance): circuits/cm_cascode/profiles/hard_2_low_vmin.yaml
* Topology (change): self-biased low-voltage cascode mirror (as the 1.2 V golden) moved into weak inversion:
*   bottom W/L = 200 (Vgs 0.39 V), cascodes W/L = 800; R1 = 8.5 k puts the bottom devices at Vds ~ 0.155 V (6 Ut),
*   >= 100 mV above Vdsat (0.047 V).
* Why: Vmin of a cascode is the knee of the composite device. In weak inversion the bottom device follows
*   1 - exp(-Vds/Ut), so Iout reaches 95 % at ~3 Ut + a few mV: bound 75.7 mV for this error and Vds; the design
*   gives 79 mV. The 1.2 V golden (moderate inversion, Vdsat 0.12 V) stops at 0.143 V. Copy error stays 0.15 %.
* One simulation per change, no automated search.
* Sky130 1.8 V LVT, VDD = 1.2 V, Iref = 20 uA into 'in', bulks at 0, 'in' only on drains/gates.
* Results (iout_err %, Rout kOhm, Vmin V, n_triode, min saturation margin V at Vo = 0.9 V):
*   tt 0.15 19881 0.079 0 0.106 | ff 0.15 20101 0.079 0 0.108 | ss 0.14 19646 0.078 0 0.105
*   sf 0.15 20346 0.079 0 0.108 | fs 0.14 19399 0.078 0 0.104  -> passes at tt ff ss sf fs (27 C)
.subckt dut in out
R1 in nb 8.5k
XM3 nb in nc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=8
XM1 nc nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XM4 out in nd 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=8
XM2 nd nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
.ends dut
