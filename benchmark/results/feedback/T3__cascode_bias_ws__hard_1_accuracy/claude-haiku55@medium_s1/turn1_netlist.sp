.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generator: PMOS-mirrored, NMOS-referenced, replica cascode stacks
* Reference diode: iin sinks the 20 uA reference
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* PMOS bottom gate bias vb1 (diode PMOS sourced by NMOS mirror of Iref)
XMPD1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMNS1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* PMOS cascode bias vb2 (replica bottom PMOS + diode PMOS + NMOS sink)
XMPR px vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMPCD vb2 vb2 px vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMNS2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* NMOS bottom bias vb4 (diode NMOS fed by PMOS mirror)
XMPS4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMND4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* NMOS cascode bias vb3 (diode NMOS over replica NMOS biased at vb4)
XMPS3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMNCD vb3 vb3 nx 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNR nx vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* Output stage: PMOS cascode source (from vdd) and NMOS cascode sink (to 0)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
.ends dut
