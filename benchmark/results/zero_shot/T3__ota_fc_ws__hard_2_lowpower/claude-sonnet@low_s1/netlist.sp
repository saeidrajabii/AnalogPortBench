.subckt dut iref inp inn out
* reference diode and tail mirror
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* bias branch A: vbp
XMA1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.25 L=1 nf=1 m=1
XPD vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* bias branch B: vbpc
XMB1 vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.25 L=1 nf=1 m=1
XPCD vbpc vbpc sb vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.35 nf=1 m=1
RB vdd sb 56k
* bias branch C: vbnc
XPC1 vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XND2 vbnc vbnc nd1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.3 nf=1 m=1
XND1 nd1 nd1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* input pair
XM1 fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM2 fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
* PMOS fold sources and cascodes
XPA fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPB fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPCA na vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XPCB out vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
* NMOS cascodes and mirror
XNCA na vbnc ma 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XNCB out vbnc mb 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XMMA ma ma 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMMB mb ma 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
