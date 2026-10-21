.subckt dut iref inp inn out
* ---- bias ----
XMb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
XMs1 vbp1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMp0 vbp1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* vbn2 branch
XMp1 vbn2 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
R1 vbn2 nd 18k
XMn2 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1 nf=1 m=1
* vbp2 branch
XMd vpd vpd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
R2 vpd vbp2 18k
XMs2 vbp2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* ---- OTA core ----
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=3
XM1 fA inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 fB inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMsA fA vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=3
XMsB fB vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=3
XMcpA xA vbp2 fA vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMcpB out vbp2 fB vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMcnA xA vbn2 nA 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMcnB out vbn2 nB 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMbA nA xA 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMbB nB xA 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
