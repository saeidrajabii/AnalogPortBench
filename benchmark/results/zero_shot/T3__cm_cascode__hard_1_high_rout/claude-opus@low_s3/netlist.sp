.subckt dut in out
* main mirror (gate node = in)
XMN1 n1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN0 n2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* reference cascode
XMN3 in vc n1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* output cascode, gate regulated
XMN2 out vg n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* bias generation (mirrored from in)
XMB1 pd in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPD pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPV vc pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNVC vc vc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
* error amplifier: PMOS input pair, NMOS mirror load
XMPT tail pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPA da n1 tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPB vg n2 tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMLA da da 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XMLB vg da 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
CC vg 0 1p
.ends dut
