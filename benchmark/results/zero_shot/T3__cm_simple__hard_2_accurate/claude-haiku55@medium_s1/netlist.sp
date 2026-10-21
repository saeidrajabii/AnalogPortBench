.subckt dut in out
* Self-biased NMOS cascode mirror, 1:1 ratio.
* Reference branch: diode-connected cascode stack, input at `in`.
XMR1 in in nx 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMR2 nx nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Output branch: cascode gate driven by `in`, bottom gate shared with the reference bottom node.
XMO1 out in ny 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMO2 ny nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
