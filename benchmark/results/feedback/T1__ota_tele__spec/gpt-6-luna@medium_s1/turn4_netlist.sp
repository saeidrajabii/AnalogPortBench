.subckt dut iref inp inn out
* Reference sink and mirrored differential-pair tail current
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* Differential pair with PMOS current-mirror load
XMN1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMN2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1

* PMOS load bias
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=1
XMNBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1

* Second gain stage; proportionally larger devices and longer channels
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=91 L=1.3 nf=1 m=1
XMNS2 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=130 L=0.65 nf=1 m=1

* Miller compensation with series nulling resistor
RCOMP n2 ncomp 1k
CCOMP ncomp out 0.6p
.ends dut
