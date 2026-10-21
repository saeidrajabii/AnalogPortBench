.subckt dut iref inp inn out

* Reference mirror: 20 uA reference, nominal 10 uA tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input stage with current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XPD n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPM n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Inverting output stage with nominal 12 uA mirrored sink.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1

* Miller compensation with series zero-control resistor.
RZ n1 nc 5k
CC nc out 0.8p

.ends dut
