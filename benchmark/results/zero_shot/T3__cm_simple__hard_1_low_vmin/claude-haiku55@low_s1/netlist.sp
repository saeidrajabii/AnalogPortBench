.subckt dut in out
* Cascode NMOS current mirror, 1:1, LVT devices.
* Reference branch: diode-connected cascode stack (in -> x -> 0).
* Output branch: mirror of the stack (out -> y -> 0), gate of the top device tied to in.
XMa in in x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMb x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMd out in y 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMc y x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
