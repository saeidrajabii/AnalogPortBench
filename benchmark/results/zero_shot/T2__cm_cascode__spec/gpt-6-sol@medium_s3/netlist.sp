.subckt dut in out
* Reference branch: the 20 uA input current establishes both gate biases.
XMN_REF in in nref 0 sky130_fd_pr__nfet_01v8_lvt W=1920 L=2 nf=1 m=1
XMN_BIAS nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=2 nf=1 m=1

* Output branch: the wider reference cascode lowers the output cascode's
* source voltage to improve low-voltage compliance.
XMN_CAS out in ncas 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=2 nf=1 m=1
XMN_OUT ncas nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=2 nf=1 m=1
.ends dut
