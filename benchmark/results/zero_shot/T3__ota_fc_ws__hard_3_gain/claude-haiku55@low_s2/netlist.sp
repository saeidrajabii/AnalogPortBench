.subckt OTA_FC_SKY130 vb2 vb3 vb4 vm vout vp
* Folded-cascode OTA (NMOS input pair, PMOS fold/cascode, NMOS cascode sinks)
* vm = inverting input (drives output-path device), vp = non-inverting input
XMN6 net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN0 net08 vb3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN9 vout vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN8 net017 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN4 net019 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN3 net020 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN5 net08 vb3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN7 net018 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP4 net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP5 vout vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends OTA_FC_SKY130

.subckt dut iref inp inn out
* Bias: iref (20 uA from vdd) is mirrored into an NMOS diode at vb4 = iref.
* vb4 = iref node (diode NMOS, sets NMOS sink gate voltage).
XMr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* vb2: PMOS diode sourced by an NMOS sink mirrored from iref (20 uA)
XMi vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMpd vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* vb3: PMOS mirror of vb2 current into an NMOS diode (cascode bias)
XMpb vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMnd vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Main OTA: vm = inn (output-path input), vp = inp
XI1 vb2 vb3 iref inn out inp OTA_FC_SKY130
.ends dut
