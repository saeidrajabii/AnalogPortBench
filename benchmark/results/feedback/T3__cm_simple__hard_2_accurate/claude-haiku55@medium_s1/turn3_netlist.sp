.subckt dut in out
* Reference stack: top device gate on vcas, bottom device gate on vbot.
XMR1 in vcas nr 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMR2 nr vbot 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Output stack: identical gate biases, so the bottom devices see the same Vgs.
XMO1 out vcas ny 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMO2 ny vbot 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Cascode gate bias (~0.57 V) from vdd (1.2 V).
RC1 vdd vcas 10k
RC2 vcas 0 9k
* Bottom gate bias (~0.45 V) from vdd.
RB1 vdd vbot 10k
RB2 vbot 0 6k
.ends dut
