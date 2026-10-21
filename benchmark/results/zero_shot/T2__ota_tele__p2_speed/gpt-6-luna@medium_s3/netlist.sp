.subckt dut iref inp inn out

* NMOS reference and mirrored sink biases
XNREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4  L=0.7 nf=1 m=1
XNBP   pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4  L=0.7 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* PMOS reference and current-mirror loads
XPREF  pref pref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPL1   n1   pref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XPL2   n2   pref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XPLOAD out  pref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1

* Differential input pair and second gain stage
XINP   n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XINN   n2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XOUT   out  n2   0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.0 nf=1 m=1

* Miller compensation with a series nulling resistor
RCOMP  out  ncomp 2.2k
CCOMP  ncomp n2   1p

.ends dut
