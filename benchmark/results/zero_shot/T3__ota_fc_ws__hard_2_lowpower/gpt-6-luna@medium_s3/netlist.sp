.subckt dut iref inp inn out
* NMOS reference sink and scaled bias-current sink
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XMBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=2 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=2 nf=1 m=1
XMNIN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XMNIP n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XMPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1
XMPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1

* Common-source output stage
XMOUTN out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XMOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1

* Miller compensation with a series zero-nulling resistor
CCOMP n2 ncomp 1p
RZ ncomp out 3.3k
.ends dut
