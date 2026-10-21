.subckt dut iref inp inn out
* bias: diode mirror from iref
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XT  t iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
* cascode bias dividers
Rn1 vdd vcn 90k
Rn2 vcn 0 150k
Rp1 vdd vcp 140k
Rp2 vcp 0 100k
* input pair
XM1 dl inp t 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XM2 dr inn t 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* nmos cascodes
XC1 vl vcn dl 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XC2 out vcn dr 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
* pmos cascodes
XP3 vl vcp pa vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XP4 out vcp pb vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
* pmos mirror (wide-swing)
XP1 pa vl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XP2 pb vl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
.ends dut
