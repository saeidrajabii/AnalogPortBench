.subckt dut iref inp inn out
* reference mirror
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* tail
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
* vbn branch
Rn vdd vbn 73k
XMbn1 vbn vbn nb 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMbn2 nb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* vbp branch
Rp vdd sp 40k
XMbp1 vbp vbp sp vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMbp2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* input pair
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
* nmos cascodes
XM3 c1 vbn d1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
XM4 out vbn d2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
* pmos cascodes
XM5 c1 vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XM6 out vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
* pmos mirror load
XM7 p1 c1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM8 p2 c1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
.ends dut
