.subckt dut iref inp inn out

* Reference mirror: nominal 80 uA tail and output bias currents.
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XMB2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* Differential first stage with PMOS current-mirror load.
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Inverting second stage; overall inp-to-out polarity is positive.
XM5 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.8 nf=1 m=1

* Series-R Miller compensation.
RCOMP n2 nc 3k
CCOMP nc out 1p

.ends dut
