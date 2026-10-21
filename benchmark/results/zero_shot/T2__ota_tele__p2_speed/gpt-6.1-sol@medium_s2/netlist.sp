.subckt dut iref inp inn out

* Reference mirror: 20 uA reference, nominal 40 uA tail.
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2

* Differential stage; input polarity accounts for second-stage inversion.
XM1 nmir inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1

* PMOS current-mirror load.
XM3 nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 n1 nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Common-source output stage with nominal 100 uA mirrored sink.
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5

* Miller compensation and zero-control resistor.
RCOMP n1 ncomp 1.5k
CCOMP ncomp out 0.85p

.ends dut
