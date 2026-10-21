.subckt dut in out
XMB_REF n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMC_REF in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMB_OUT n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMC_OUT out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
.ends dut
