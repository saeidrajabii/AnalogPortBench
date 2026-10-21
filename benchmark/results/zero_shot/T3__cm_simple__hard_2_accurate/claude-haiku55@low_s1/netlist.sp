.subckt dut in out
* Wide-swing cascode current mirror (reference branch and output branch are identical)
* Reference branch: in -> XMR1 (cascode) -> xn -> XMR2 (bottom) -> 0
XMR1 in vb xn 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMR2 xn vgb 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* Output branch: out -> XMO1 (cascode) -> yn -> XMO2 (bottom) -> 0
XMO1 out vb yn 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMO2 yn vgb 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* Bias for bottom gate: diode-connected device fed by a resistor from vdd
XMGB vgb vgb 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
RGB vdd vgb 37.5k
* Bias for cascode gate: diode-connected device fed by a resistor from vdd
XMGC vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
RGC vdd vb 35k
.ends dut
