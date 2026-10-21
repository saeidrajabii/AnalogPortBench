.subckt dut iref inp inn out
* 20 uA reference diode and scaled NMOS tail-current mirror
XMREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMTAIL tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Differential input pair with PMOS current-mirror load
XMNIP  n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=8  L=0.6 nf=1 m=1
XMNI N  n2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=8  L=0.6 nf=1 m=1
XMPD  n1   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XMPM  n2   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* PMOS second-stage bias diode and 4:1 output current mirror
XMNSB pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPB  pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=5  L=1 nf=1 m=1
XMP2  out  pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Second gain stage
XMN2  out  n2   0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Miller compensation with series nulling resistor
RCOMP n2 nc 1k
CCOMP nc out 0.5p
.ends dut
