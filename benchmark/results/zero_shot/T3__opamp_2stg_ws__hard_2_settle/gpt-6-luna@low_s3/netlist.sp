.subckt dut iref inp inn out
* Reference-current sink and mirrors
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6

* Differential input pair with PMOS current-mirror load
XMNI ninn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNP ninp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP1 ninn ninn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 ninp ninn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second-stage PMOS bias: an 80-uA reference branch and output mirror
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMPLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=4
XMOUT out ninp 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4

* Miller compensation
CCOMP ninp ncomp 800f
RZ ncomp out 1k
.ends dut
