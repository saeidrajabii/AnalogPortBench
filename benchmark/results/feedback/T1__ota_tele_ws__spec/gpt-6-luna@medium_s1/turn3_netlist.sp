.subckt dut iref inp inn out
* Reference NMOS and mirrored tail-current sink
XMREFN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1

* PMOS bias reference, sunk by a copy of the reference NMOS current
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2.5 nf=1 m=1

* Differential input pair with PMOS current-mirror load
XMINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2.5 nf=1 m=1
XMINP n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2.5 nf=1 m=1
XMPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2.5 nf=1 m=1

* Second gain stage
XMOUTN out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=2.5 nf=1 m=1
XMOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2.5 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ n2 ncomp 3k
CCOMP ncomp out 500f
.ends dut
