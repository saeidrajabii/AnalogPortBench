.subckt dut in out
* cascode devices, gates tied to in (diode MC1)
XMC1 in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMC2 out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* wide, long mirror devices in weak inversion
XMA n1 g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMB n2 g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* bias for mirror gate
XMD g g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
RB vdd g 45k
.ends dut
