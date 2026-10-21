.subckt dut in out
* Cascode NMOS current mirror (sink). Reference diode stack MR1/MR2 sets the
* gate voltages; output stack MO1/MO2 mirrors them. Gates are driven only
* by the reference branch, so no element senses `out`.
* MR1: diode-connected top device, drain=gate=in, source=nb
* MR2: diode-connected bottom device, drain=gate=nb, source=0
* MO1: output bottom device, gate=nb, source=0, drain=x
* MO2: output cascode device, gate=in, source=x, drain=out
XMR1 in in nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMR2 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMO1 x nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMO2 out in x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
