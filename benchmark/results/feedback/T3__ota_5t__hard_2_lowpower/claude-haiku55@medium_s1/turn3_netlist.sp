.subckt dut iref inp inn out
* Bias: 20 uA reference diode (NMOS, drain = iref) mirrored to the tail (W ratio 40/68)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=68 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* 5T OTA: NMOS input pair (wide, long-channel, weak inversion), PMOS mirror load
XM1 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
XMp1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMp0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
