.subckt dut iref inp inn out
* Bias: iref -> NMOS diode (20uA), 1:4 copy (5uA) -> PMOS diode, 1:6 PMOS tail (30uA)
XMN1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMN0 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMP1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=6
* PMOS input pair
XMPA nd inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMPB out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
* NMOS mirror load
XMNA nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNB out nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
