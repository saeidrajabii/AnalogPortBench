.subckt dut in out
* Reference device: diode-connected at 'in', so the 20 uA from vdd sets its Vgs
XMref in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=14.4 L=2 nf=1 m=1
* Output device: same Vgs as the reference, so it mirrors the current into 'out'
XMout out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=14.4 L=2 nf=1 m=1
.ends dut
