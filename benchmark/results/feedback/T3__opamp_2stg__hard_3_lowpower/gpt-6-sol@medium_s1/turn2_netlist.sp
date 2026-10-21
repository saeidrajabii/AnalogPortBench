.subckt dut iref inp inn out
* Reference current is mirrored into the differential pair and output stage.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1
XSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=1 nf=1 m=1

* Differential input stage with longer-channel devices for higher gain.
XINP   n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=95 L=3.5 nf=1 m=1
XINN   n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=95 L=3.5 nf=1 m=1
XPREF  n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=3.5 nf=1 m=1
XPLOAD n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=3.5 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1.2 nf=1 m=1
XCAS  out vcas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=0.5 nf=1 m=1
RTOP  vdd vcas 200k
RBOT  vcas 0 300k

* Miller compensation with a series nulling resistor.
RZERO n1 nc 4k
CCOMP nc out 550f
.ends dut
