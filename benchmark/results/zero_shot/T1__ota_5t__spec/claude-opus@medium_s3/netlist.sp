.subckt dut iref inp inn out
* Bias: iref -> NMOS diode, mirrored to a PMOS diode, which sets the PMOS tail
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XB2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XB3 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=5
* PMOS input pair (inp on the diode side gives non-inverting gain)
XP1 x inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* NMOS current-mirror load
XN1 x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
XN2 out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
.ends dut
