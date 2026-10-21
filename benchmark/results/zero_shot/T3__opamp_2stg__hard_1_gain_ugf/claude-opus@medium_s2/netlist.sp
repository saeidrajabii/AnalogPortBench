.subckt dut iref inp inn out
* ---- bias: iref mirrored by NMOS diode (node iref = vbn) ----
XMN1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=1
XMNB  vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1
* self-biased PMOS cascode bias branch (10 uA)
XMPB1 yb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMPB2 vbp vbpc yb vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.35 nf=1 m=1
RP vbp vbpc 25k
* ---- stage 1: NMOS-input folded cascode ----
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.5 L=1 nf=1 m=1
XMA   n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMB   n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMPS1 n1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21 L=0.5 nf=1 m=1
XMPS2 n2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21 L=0.5 nf=1 m=1
XMPC1 d1 vbpc n1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMPC2 o1 vbpc n2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
* self-biased wide-swing NMOS cascode mirror
RN d1 d1b 10k
XMN9  d1b d1 x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN10 o1 d1 x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN7  x1 d1b 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
XMN8  x2 d1b 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
* ---- stage 2: PMOS common source + NMOS sink ----
XMP2  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.35 nf=1 m=4
XMO   out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=6
* ---- Miller compensation with nulling resistor ----
RZ o1 nz 2.5k
CC nz out 0.5p
.ends dut
