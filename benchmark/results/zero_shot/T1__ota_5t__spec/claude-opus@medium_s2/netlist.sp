.subckt dut iref inp inn out
* Bias: iref -> NMOS diode -> NMOS mirror (1/2) -> PMOS diode -> PMOS tail (x2)
XNB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=2
XNM  pb   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XPB  pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XPT  tail pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
* PMOS input pair (inp drives the diode side, so inp is non-inverting)
XP1  d1   inp  tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP2  out  inn  tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS current-mirror load
XN1  d1   d1   0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XN2  out  d1   0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
.ends dut
