.subckt dut iref inp inn out

* Reference-current mirror and input-pair tail bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2

* Differential input stage with current-mirror load
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XLOADREF n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XLOAD n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Common-source output stage
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.6 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5

* Miller compensation with series zero-control resistor
RCOMP n1 nc 800
CCOMP nc out 0.9p

* Candidate design; compliance requires simulation with the supplied models.
.ends dut
