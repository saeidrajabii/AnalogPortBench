* cm_simple, VDD = 1.2 V (same design as 1.8 V)
* Verified with benchmark/evaluate.py (TT, 27 C, same testbench and spec as every other design).
* Design: original 1:1 topology, long channel (L = 4 um) for low output conductance and small copy error,
* wide (W = 40 um) so the devices run at low overdrive and saturate at a low output voltage.
.subckt dut in out
XM1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XM0 out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
.ends dut
