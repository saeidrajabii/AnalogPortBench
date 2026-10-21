.subckt dut in out
* Wide-swing cascode NMOS mirror, 1.2 V supply
* Reference branch (diode-connected cascode)
XM3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Output branch (wide-swing cascode, gate biased at vb)
XM2 out vb net2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Cascode gate bias: about 0.77 V from VDD = 1.2 V
R1 vdd vb 10k
R2 vb 0 18k
.ends dut
