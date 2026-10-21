.subckt dut iref inp inn out
* ---- bias ----
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XB1 vbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
XBP1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XB2 vbpc vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
XBP3 nx vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XBP4 vbpc vbpc nx vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=1
XBP5 vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XBX vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1 nf=1 m=1
* ---- OTA ----
XMT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=0.5 nf=1 m=1
XM1 f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XM2 f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XMP1 f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP2 f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMC1 d1 vbpc f1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XMC2 out vbpc f2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XNC1 d1 vbnc s1 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNC2 out vbnc s2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNM1 s1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNM2 s2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
.ends dut
