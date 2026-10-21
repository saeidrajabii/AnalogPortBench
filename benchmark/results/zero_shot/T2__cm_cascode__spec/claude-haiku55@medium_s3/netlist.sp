.subckt dut in out
* Reference branch: diode-connected cascode (in = Vgs_bottom + Vgs_cascode)
XMcr in in xr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMbr xr xr 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Output branch: cascode gate biased at vb, lower than the reference cascode gate
XMco out vb yo 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMbo yo xr 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Cascode gate bias: diode-connected NMOS fed from vdd through a resistor (~20 uA)
Rb vdd vb 22.5k
XMbias vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends dut
