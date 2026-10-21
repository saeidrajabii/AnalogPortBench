.subckt dut in out
* matched mirror pair, gate driven by equalizing amplifier
XMN1 in  g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN2 out g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* bias generation
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
RB pb 0 130k
XMPB2 nb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNB nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* PMOS input pair (low common mode)
XMPT tp pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP1 d1 in  tp vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP2 g  out tp vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN4 g  d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* NMOS input pair (high common mode)
XMNT tn nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN5 d5 in  tn 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMN6 g  out tn 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMP7 d5 d5 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP8 g  d5 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* compensation
CC g 0 1p
.ends dut
