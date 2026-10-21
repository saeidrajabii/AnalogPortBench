.subckt dut iref inp inn out
* reference mirror
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* tail 80uA
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS bias: vbp (10uA diode), vbpc (stacked)
XMsk1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMpd1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMpx q vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMpd2 vbpc vbpc q vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMsk2 vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* NMOS cascode bias vbnc
XMpy vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMnd vbnc vbnc d1 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMnx d1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* input pair
XMi1 fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMi2 fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.35 nf=1 m=1
* PMOS sources and cascodes
XMps1 fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XMps2 fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XMpc1 na vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XMpc2 out vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=8
* NMOS cascode mirror load
XMn3 s1 na 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMn5 na vbnc s1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMn4 s2 na 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMn6 out vbnc s2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
