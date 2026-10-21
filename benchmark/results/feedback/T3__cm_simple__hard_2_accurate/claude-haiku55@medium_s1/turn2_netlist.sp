.subckt dut in out
* Reference branch: diode-connected cascode stack, input at `in`.
XMR1 in in nx 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMR2 nx nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Output branch: cascode gate biased by a divider (~0.55 V) instead of `in`,
* which lets the bottom node `ny` sit lower and extends the output swing.
XMO1 out vcb ny 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMO2 ny nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Cascode gate bias divider from vdd (1.2 V) to ground.
RB1 vdd vcb 12k
RB2 vcb 0 10k
.ends dut
