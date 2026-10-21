.subckt dut iref inp inn out
* ---- bias: iref diode and mirrors ----
XMR   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMA   vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* PMOS cascode bias: vb2 = vdd - Vsg - I*R1
XMPD  pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
R1    pd vb2 30k
* NMOS cascode bias: vb3 = Vgs + I*R2
XMPB  vb3 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
R2    vb3 nd 30k
XMND  nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* ---- input pair ----
XM2   net010 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM1   net016 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* ---- top PMOS sources (self-biased by net1) ----
XMP0  net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1  net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---- PMOS cascodes ----
XMP4  net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP5  out vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* ---- NMOS cascoded sinks ----
XMN6  net1 vb3 s1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN9  out vb3 s2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN7  s1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN8  s2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
