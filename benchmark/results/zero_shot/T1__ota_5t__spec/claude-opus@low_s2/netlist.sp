.subckt dut iref inp inn out
* Bias: the reference current enters a diode-connected NMOS and is mirrored 2x into the tail
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* Input pair: wide so it runs near weak inversion and keeps the tail out of triode at VCM = 0.5 V
XM1  n9  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2  out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  n9  n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4  out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
