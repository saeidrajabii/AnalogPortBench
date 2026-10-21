.subckt dut iref inp inn out
* ---------- bias ----------
MNr   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS reference diode (20uA)
XMNp  vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPd  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* NMOS cascode bias vcn (20uA into weak diode)
XMPn  vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNcb vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
* PMOS cascode bias vcp (20uA from weak diode)
XMNq  vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPcb vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1 nf=1 m=1
* ---------- OTA core ----------
* tail 80uA
XMPt  tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=4
* input pair (inp on mirror side, inn on output side)
XMP1  fl inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMP2  fr inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* NMOS sinks 60uA each
XMN1  fl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
XMN2  fr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* NMOS cascodes
XMN3  x vcn fl 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN4  out vcn fr 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS cascode load (low-voltage cascode mirror)
XMP3  x vcp sl vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP4  out vcp sr vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP5  sl x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP6  sr x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
