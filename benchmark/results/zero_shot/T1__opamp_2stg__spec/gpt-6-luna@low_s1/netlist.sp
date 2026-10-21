.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMB0 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB1 vb4 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* The reference current enters the drain of the diode-connected device.
RREF iref vb3 1

* PMOS differential input pair with NMOS tail current source
XMP0 n1 inp nt vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP1 n2 inn nt vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP2 nt vb3 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=2
* PMOS current-mirror load
XMP3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XMN0 out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XMP5 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1
CC0 n2 out 500f
RR0 n2 nc 3k
.ends dut
