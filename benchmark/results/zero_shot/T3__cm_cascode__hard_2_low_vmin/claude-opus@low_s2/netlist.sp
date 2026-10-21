.subckt dut in out
* reference: weak-inversion device, drain set low via R1
R1  in x1 12k
XM1 x1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=8
* output: matched device + regulated cascode
XM2 x2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=8
XMC2 out g x2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=4
* bias for amplifier tail (mirrored from in, ~5uA)
XMB1 pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=2
XMP0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
XMP1 tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
* PMOS differential pair, forces x2 = x1
XMPA g  x2 tail vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XMPB d1 x1 tail vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
* NMOS mirror load
XMNB d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNA g  d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends dut
