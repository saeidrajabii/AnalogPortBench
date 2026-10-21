* cm_cascode, hard spec point H1 (extremely high Rout, exact copy): circuits/cm_cascode/profiles/hard_1_high_rout.yaml
* Topology (change): regulated (gain-boosted) cascode mirror with a regulated reference branch.
*   Output: M2 (gate 'in') + cascode M4 whose gate vg4 is driven by the common-source amplifier Ma2 (gate nd)
*   with PMOS current-source load Mp2: Ma2 holds nd = Vgs(Ma2) ~ 0.36 V and multiplies Rout by its gain.
*   Reference: identical structure (M1, M3, Ma1, Mp1), M1 gate at 'in' (diode through the regulated cascode),
*   so nc = Vgs(Ma1) = nd at every corner -> both bottom devices see the same Vds: copy error < 0.005 %.
*   Bias: Mnb mirrors Iref/10 into the PMOS diode Mpd; Mp1/Mp2 copy it (~1.7 uA each). Total extra ~5.3 uA.
* Why: a passive cascode reaches gm*ro*ro ~ 1e8 Ohm (1.2 V golden: 74 MOhm); >= 1 GOhm needs a loop. A plain
*   regulated cascode at 1.2 V must keep nd = one Vgs, so Ma1/Ma2 are wide (W/L = 200, Vgs 0.36 V) to leave
*   headroom for M2 (Vds 0.36 vs Vdsat 0.12) and the cascode; short cascodes/amp devices keep Rout ~ 2 GOhm,
*   inside the testbench's resolution (8-digit current output, 0.01 V step: ~1e-11 A per step at 1 GOhm).
* One simulation per change, no automated search (r1: amp loads near triode; r2: Rout 4 GOhm, too close to the
*   resolution limit; r3/r4 shortened amp and cascodes).
* Sky130 1.8 V LVT, VDD = 1.2 V, Iref = 20 uA into 'in', bulks at 0, 'in' only on drains/gates.
* Results (iout_err %, Rout kOhm, Vmin V, n_triode, min saturation margin V at Vo = 0.9 V):
*   tt 0.00 2.22e6 0.142 0 0.113 | ff 0.00 2.00e6 0.140 0 0.116 | ss 0.00 1.67e6 0.144 0 0.104
*   sf 0.00 2.00e6 0.140 0 0.119 | fs 0.00 1.25e6 0.145 0 0.066      -> passes at tt ff ss sf fs (27 C)
.subckt dut in out
XM3 in vg3 nc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM1 nc in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMa1 vg3 nc 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMp1 vg3 vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XM4 out vg4 nd 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 nd in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMa2 vg4 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMp2 vg4 vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XMnb vpb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=4 nf=1 m=1
XMpd vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends dut
