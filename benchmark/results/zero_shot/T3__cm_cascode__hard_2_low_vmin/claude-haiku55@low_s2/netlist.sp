.subckt dut in out
* Cascode NMOS mirror. Reference branch: MN3 and MN1 are diode-connected.
* Output branch: MN2 is cascode with gate at fixed bias vb; MN0 gate follows net1.
* Bias vb is a resistive divider from vdd (no DC current into the mirror gates).
XMN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=0.5 nf=1 m=1
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=0.5 nf=1 m=1
XMN2 out vb net2 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=0.5 nf=1 m=1
XMN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=0.5 nf=1 m=1
Rb1 vdd vb 500k
Rb2 vb 0 500k
.ends dut
