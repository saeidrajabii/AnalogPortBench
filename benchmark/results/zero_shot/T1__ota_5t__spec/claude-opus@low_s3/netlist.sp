.subckt dut iref inp inn out
* Bias: iref -> NMOS diode, mirrored to 10uA into PMOS diode
XMN1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMP1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source (30uA)
XMP2 tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=3
* PMOS input pair
XMP3 d1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP4 out inn tail tail sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS mirror load
XMN3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XMN4 out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
.ends dut
