* cm_cascode, VDD = 1.2 V (same design as 1.8 V)
* Verified with benchmark/evaluate.py (TT, 27 C, same testbench and spec as every other design).
* Design (topology change): self-biased low-voltage cascode mirror. R1 makes the cascode gate sit I*R1 above
* the bottom gate, so the bottom devices run at Vds ~ 0.3 V instead of a full Vgs; minimum output voltage
* ~0.14 V. All bulks to ground (the original's source-tied bulks would need a deep n-well).
.subckt dut in out
R1 in nb 15k
XM3 nb in nc 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XM1 nc nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XM4 out in nd 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XM2 nd nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
.ends dut
