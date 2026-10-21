.subckt dut in out
* bottom mirror devices (gate = in)
XMN1 n1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMN0 n2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
* cascode devices (shared regulated gate g)
XMN3 in g n1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XMN2 out g n2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* bias: copy of Iref, develops reference voltage s across R1
XMN6 pd in 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
XMP2 s pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
R1 s 0 4k
* error amplifier: PMOS pair, tail ~10uA
XMP3 tl pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XMA da n2 tl vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMB db s tl vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMLD db db 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMLO da db 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
Rg da g 1
.ends dut
