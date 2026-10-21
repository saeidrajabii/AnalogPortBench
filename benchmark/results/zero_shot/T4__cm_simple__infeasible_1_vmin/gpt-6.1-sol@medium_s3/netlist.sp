.subckt dut in out
* Large W/L targets weak inversion; long L improves output resistance.
* Output scaling provides 8% nominal current margin.
XMN_REF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=200
XMN_OUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=216
.ends dut
