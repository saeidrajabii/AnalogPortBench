.subckt dut in out
* Self-biased NMOS cascode current mirror, 1:1 ratio.
* Reference current enters `in` from vdd; mirrored current is sunk from `out`.
* Reference cascode MC1 is diode-connected (drain = gate = in), so the reference
* current never flows into a source terminal.
XMC1 in in nc1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB1 nc1 nc1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMC0 out in nc0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB0 nc0 nc1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
