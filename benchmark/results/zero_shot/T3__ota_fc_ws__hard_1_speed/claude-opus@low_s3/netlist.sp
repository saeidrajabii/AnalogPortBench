.subckt dut iref inp inn out
* ---- Bias generation (20 uA reference, mirrored) ----
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS reference branch
XMB1 vbpm iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPB0 vbpm vbpm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* NMOS cascode bias vb3 (~0.63 V)
XMPB1 vb3 vbpm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
* PMOS cascode bias vbpc (~0.52 V)
XMB2 vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPC vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
* ---- OTA ----
* tail current 80 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* NMOS input pair
XM1 fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.3 nf=1 m=1
XM2 fr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.3 nf=1 m=1
* PMOS top devices (60 uA each), self-biased by net1
XMP1 fl net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP2 fr net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS cascodes
XMP3 net1 vbpc fl vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMP4 out vbpc fr vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
* NMOS cascoded current sinks (20 uA each)
XMN3 net1 vb3 sl 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN4 out vb3 sr 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN5 sl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN6 sr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
