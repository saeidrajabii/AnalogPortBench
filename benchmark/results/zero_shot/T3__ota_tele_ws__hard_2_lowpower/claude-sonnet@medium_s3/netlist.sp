.subckt dut iref inp inn out
* input bias mirror
XN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
XN1 pd iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* pmos mirror feeding vbn stack
XP0 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XP1 vbn pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XNA vbn vbn nb 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XNB nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* vbp stack
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPA vbp vbp pb vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* input pair
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* nmos cascodes
XM3 x vbn d1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 out vbn d2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* pmos cascodes
XM5 x vbp s7 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM6 out vbp s8 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* pmos mirror
XM7 s7 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM8 s8 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
