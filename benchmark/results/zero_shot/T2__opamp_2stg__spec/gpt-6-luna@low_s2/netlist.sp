* Best-effort SKY130 implementation. Device sizes and performance require
* verification with the supplied SKY130 model library and testbench.

.subckt Bias iref vbp vbn
* Reference current is sunk by a diode-connected NMOS, not by a transistor source.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS mirror branch biases the diode-connected PMOS.
XMNPM vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends Bias

.subckt Opamp vbp vbn inp inn out
* PMOS differential input pair and NMOS current-mirror load.
XMP0 n1 inp ntail vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP1 n2 inn ntail vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP2 ntail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XMN0 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN1 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Second gain stage, with Miller compensation.
XMN2 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XMP3 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=0.5 nf=1 m=1
CCOMP n2 out 2p
.ends Opamp

.subckt dut iref inp inn out
XI_BIAS iref vbp vbn Bias
XI_AMP vbp vbn inp inn out Opamp
.ends dut
