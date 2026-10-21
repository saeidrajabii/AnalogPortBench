.subckt dut iref inp inn out
* Bias: NMOS reference mirror (tail current ~40 uA from 20 uA iref)
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNT   tn   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Resistive bias for cascode gates (negligible DC current)
Rb1 vdd  vbpc 5meg
Rb2 vbpc 0    3.3meg
Rb3 vdd  vbnc 3meg
Rb4 vbnc 0    5meg

* Folded/telescopic OTA core (topology follows the source OTA)
XMP0 n0100 n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP1 n082  vbpc n0100 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP2 n097  n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP3 out   vbpc n097 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

XMN0 n082 vbnc n074 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN1 n074 inp  tn   0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out  vbnc n030 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN3 n030 inn  tn   0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
