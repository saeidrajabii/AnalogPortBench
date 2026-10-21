.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS bias: reference current into iin (via 1 ohm to vb3), diode stack ----
RB iin vb3 1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---- NMOS cascode sink (identical geometry to the bias chain, so the mirror ratio is 1:1) ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---- PMOS bias: diode-connected PMOS at vb2, sunk by an NMOS mirror of the reference ----
XMPB vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---- PMOS source: single device (no PMOS cascode, since two stacked PMOS have no headroom at 1.2 V) ----
XMP0 out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb1 is unused by the source; tie it to vb2 through 1 ohm so the port is defined
RV1 vb1 vb2 1
.ends dut
