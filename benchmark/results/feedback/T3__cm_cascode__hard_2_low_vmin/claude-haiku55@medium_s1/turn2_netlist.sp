.subckt dut in out
* Wide-swing cascode NMOS mirror, 1:1, SKY130 LVT devices (revision 2)
* Main mirror devices (W=80, L=1.0)
XMN3 in  vb n1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1
XMN1 n1  g1 0  0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1
XMN2 out vb n2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1
XMN0 n2  g1 0  0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1

* Bottom bias: diode-connected replica of MN1, biased with ~20 uA from vdd
RB1 vdd g1 35k
XMB1 g1 g1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1

* Cascode bias: smaller diode-connected device, biased with ~20 uA from vdd
RB2 vdd vb 32.5k
XMB2 vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.5 L=1.0 nf=1 m=1
.ends dut
