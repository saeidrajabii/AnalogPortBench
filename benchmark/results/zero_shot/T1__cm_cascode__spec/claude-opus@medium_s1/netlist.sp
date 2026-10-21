.subckt dut in out
* low-voltage (wide-swing) self-biased cascode NMOS current mirror
* cascode gate bias = in ; bottom gate bias = nb ; V(in)-V(nb) = Iref*R
R1  in nb 12k
XMN3 nb   in   net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN1 net1 nb   0    0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out  in   net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN0 net2 nb   0    0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
