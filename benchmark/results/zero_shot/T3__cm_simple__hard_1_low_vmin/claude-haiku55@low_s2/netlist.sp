.subckt dut in out
* Cascode NMOS current mirror, 1:1 (reference branch M1/M2, output branch M3/M4)
* Reference: 20 uA from vdd into node in; M2 and M1 are stacked diodes
XM1 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 in in nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Output: M3 mirrors M1 (same gate), M4 is the cascode with gate at in
XM3 nd nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out in nd 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
