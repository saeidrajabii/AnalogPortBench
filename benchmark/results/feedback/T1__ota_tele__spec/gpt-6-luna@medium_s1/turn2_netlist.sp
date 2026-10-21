.subckt dut iref inp inn out
* 20 uA reference sink and mirrored tail/bias sinks
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XBIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1

* Differential pair with PMOS current-mirror load
XMN1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMN2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1

* PMOS bias reference and second gain stage
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=1
XMN BIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=1.0 nf=1 m=1
XMNS2 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Miller compensation with series nulling resistor
RCOMP n2 ncomp 1k
CCOMP ncomp out 0.6p
.ends dut
