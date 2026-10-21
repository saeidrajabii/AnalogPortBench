.subckt dut iin out vb1 vb2 vb3 vb4
* Long-channel, low-current-density mirrors reduce output-current
* variation while allowing operation near both supply rails.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=10 nf=1 m=100
XNBIAS pgate iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=10 nf=1 m=100
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=10 nf=1 m=100

XPREF pgate pgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=10 nf=1 m=100
XPOUT out pgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=10 nf=1 m=100

RVB1 vb1 pgate 1
RVB2 vb2 pgate 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
