.subckt dut iref inp inn out
* ---- bias ----
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.4 L=0.8 nf=1 m=1
* PMOS cascode-gate bias (Vb2): drop across R1 sets mirror headroom
R1 vdd s2 14k
XMX vb2 vb2 s2 vdd sky130_fd_pr__pfet_01v8_lvt W=6.4 L=0.8 nf=1 m=1
XMS1 vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.2 L=0.8 nf=1 m=1
* NMOS cascode-gate bias (Vb3)
R3 vdd vb3 60k
XMC vb3 vb3 s3 0 sky130_fd_pr__nfet_01v8_lvt W=3.2 L=0.8 nf=1 m=1
R2 s3 0 14k
* ---- OTA ----
* tail
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.6 L=0.8 nf=1 m=1
* input pair: inp -> left (net010), inn -> right (net016)
XMN2 n010 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.4 nf=1 m=1
XMN1 n016 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.4 nf=1 m=1
* PMOS mirror sources
XMP0 n010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=19.2 L=0.8 nf=1 m=1
XMP2 n016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=19.2 L=0.8 nf=1 m=1
* PMOS cascodes
XMP4 net1 vb2 n010 vdd sky130_fd_pr__pfet_01v8_lvt W=9.6 L=0.8 nf=1 m=1
XMP5 out vb2 n016 vdd sky130_fd_pr__pfet_01v8_lvt W=9.6 L=0.8 nf=1 m=1
* NMOS cascodes
XMN6 net1 vb3 n018 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=0.8 nf=1 m=1
XMN9 out vb3 n017 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=0.8 nf=1 m=1
* NMOS bottom sinks
XMN7 n018 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=0.8 nf=1 m=1
XMN8 n017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=0.8 nf=1 m=1
.ends dut
