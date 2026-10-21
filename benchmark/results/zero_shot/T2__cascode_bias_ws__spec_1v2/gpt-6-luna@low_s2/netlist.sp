.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference: the reference current enters the drain, not the source.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS output mirror and cascode. vb3 is the cascode gate bias.
XMNOUT nsink iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNCAS out vb3 nsink 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS bias stack; the diode-connected devices establish vb3 and vb4.
XMNB4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS reference branch, biased by an ideal resistor from the available supply.
RPR vdd psrc 60k
XMPREF psrc psrc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS output mirror and cascode.
XMPMIR npcas psrc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPCAS out vb2 npcas vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS cascode-gate bias; vb1 is the PMOS mirror gate reference.
XMPB1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPB2 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
