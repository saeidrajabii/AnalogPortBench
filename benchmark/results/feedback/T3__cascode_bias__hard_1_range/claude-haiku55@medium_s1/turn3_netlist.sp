.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: 20 uA sunk through diode-connected stack ----
RR0 iin vb3 1
XMB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMB4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1

* ---- PMOS source bias vb1: diode PMOS sourced from vdd, sunk by NMOS ----
XMB2 vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1

* ---- PMOS cascode bias vb2: replica of output stack (MPD ~ MP1, MPE ~ MP0) ----
XMPD xr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XMPE vb2 vb2 xr vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XMB5 vb2 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1

* ---- output stage ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
.ends dut
