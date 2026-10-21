.subckt dut iref inp inn out
* bias: iref enters diode stack Mc (vb3) on Mref (vb4)
XMc   iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=5.5 L=0.3 nf=1 m=1
XMref vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS cascode bias branch (about 10 uA)
Rb vdd sb 30k
XMpr vb2 vb2 sb vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMnm vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* OTA
XMT  tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XMN2 n10 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.3 nf=1 m=1
XMN1 n16 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.3 nf=1 m=1
XMP0 n10 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP3 n16 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP4 n1 vb2 n10 vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.35 nf=1 m=1
XMP5 out vb2 n16 vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.35 nf=1 m=1
XMN6 n1 iref n18 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.3 nf=1 m=1
XMN9 out iref n17 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.3 nf=1 m=1
XMN7 n18 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.5 nf=1 m=1
XMN8 n17 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.5 nf=1 m=1
.ends dut
