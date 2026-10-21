.subckt dut iref inp inn out
* Reference current sink and NMOS current mirrors
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XMSECOND nload iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1

* Differential input stage and PMOS mirror load
XMN1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMN2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* PMOS bias reference and second-stage load
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMPLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1

* Second gain stage
XMNOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1

* Miller compensation
CCOMP n2 ncomp 2p
RCOMP ncomp out 2k
.ends dut
