* cm_simple, hard spec point H2 (accurate copy, high Rout, low Vmin): circuits/cm_simple/profiles/hard_2_accurate.yaml
* Topology (change): self-biased low-voltage cascode mirror. Iref flows in -> R1 -> nb -> M3 -> nc -> M1; M1/M2
*   gates at nb, cascode gates at 'in' = nb + Iref*R1 (0.18 V), so both bottom devices run at Vds ~ 0.17 V.
*   Bottom W/L = 50 (Vgs 0.45 V, moderate/weak inversion), cascodes W/L = 200.
* Why: a simple mirror's error at Vo = 0.9 V is (0.9 V - Vgs) * gds/Id, ~2 % even at L = 4 um (the 1.2 V golden);
*   0.13 % would need gds/Id < 1/350 V^-1, far beyond any Sky130 length. The cascode pins the output bottom
*   device to the same Vds as the reference (0.172 vs 0.167 V) and multiplies Rout by gm*ro (~27x), while the
*   low-voltage bias keeps the compliance at ~0.1 V.
* One simulation per change, no automated search.
* Sky130 1.8 V LVT, VDD = 1.2 V, Iref = 20 uA into 'in', bulks at 0, 'in' only on drains/gates.
* Results (iout_err %, Rout kOhm, Vmin V, n_triode, min saturation margin V at Vo = 0.9 V):
*   tt 0.11 22573 0.095 0 0.101 | ff 0.12 22910 0.095 0 0.103 | ss 0.11 22198 0.095 0 0.100
*   sf 0.12 23229 0.095 0 0.103 | fs 0.11 21882 0.095 0 0.099  -> passes at tt ff ss sf fs (27 C)
.subckt dut in out
R1 in nb 9k
XM3 nb in nc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XM1 nc nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XM4 out in nd 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XM2 nd nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
.ends dut
