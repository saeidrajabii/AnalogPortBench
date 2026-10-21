.subckt dut iref inp inn out
* Bias: iref (20 uA) into diode-connected NMOS, mirrored 20:9 into the tail
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=20
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=9
* Input pair (weak inversion for high gm/Id)
XM1  net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2  out  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XM4  out  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.8 nf=1 m=1
.ends dut
