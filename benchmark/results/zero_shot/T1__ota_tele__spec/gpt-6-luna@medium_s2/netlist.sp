.subckt dut iref inp inn out
* 20 uA reference sink and scaled NMOS current mirrors
XREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=4  L=1 nf=1 m=1
XTAIL  tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=1
XOUTN  out   iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load
XINP   nleft inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN   n1    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XLOAD1 nleft nleft vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XLOAD2 n1    nleft vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS common-source second stage
XAMP2  out   n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Miller compensation with series nulling resistor
CCOMP  n1    ncomp 700f
RNULL  ncomp out   3k
.ends dut
