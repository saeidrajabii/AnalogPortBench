.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and mirrored sink for the PMOS reference branch
XNREF   iin   iin   0   0   sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XNPREF  nref  iin   0   0   sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1

* PMOS reference and mirrored source
XPREF   pref  pref  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=1
XNOUT   out   iin   0   0   sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XPOUT   out   pref  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=1

* Bias outputs
RVB1    vb1   pref  1m
RVB2    vb2   pref  1m
RVB3    vb3   iin   1m
RVB4    vb4   iin   1m
.ends dut
