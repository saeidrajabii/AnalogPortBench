.subckt dut iref inp inn out
* ---------------- bias ----------------
* iref node is the diode-connected reference (vb4)
XMb4 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
* PMOS diode branch to feed the vb3 stack
XMnp nP iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.8 nf=1 m=1
XMpd nP nP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.75 L=0.8 nf=1 m=1
XMpm vb3 nP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.75 L=0.8 nf=1 m=1
XMc2 vb3 vb3 r3 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.8 nf=1 m=1
R3 r3 0 40k
* PMOS cascode bias vb2
XMnq vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.8 nf=1 m=1
XMp2 vb2 vb2 r2 vdd sky130_fd_pr__pfet_01v8_lvt W=2.75 L=0.8 nf=1 m=1
R2 vdd r2 56k
* ---------------- OTA ----------------
* tail (two cascoded legs)
XMN3 net020 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN4 net019 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN0 net08 vb3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN5 net08 vb3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
* input pair
XMN2 net010 inp net08 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1 net016 inn net08 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS sinks + cascodes
XMN7 net018 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN6 net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN8 net017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN9 out vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
* PMOS sources + cascodes
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XMP4 net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XMP5 out vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
.ends dut
