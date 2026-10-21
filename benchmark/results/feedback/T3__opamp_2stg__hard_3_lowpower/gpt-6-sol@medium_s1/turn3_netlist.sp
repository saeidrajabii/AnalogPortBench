.subckt dut iref inp inn out
* Mirror the reference current into the input and output stages.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1
XSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=1 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP   n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=2.3 nf=1 m=1
XINN   n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=2.3 nf=1 m=1
XPREF  n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2.5 nf=1 m=1
XPLOAD n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2.5 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1.4 nf=1 m=1
XCAS  out vcas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.6 nf=1 m=1
RTOP  vdd vcas 200k
RBOT  vcas 0 370k

* Series-RC Miller compensation.
RZERO n1 nc 3k
CCOMP nc out 750f
.ends dut
