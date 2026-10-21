.subckt dut iref inp inn out
* Reference sink: the reference current is mirrored, not passed through
* the source of a transistor.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1

* PMOS bias reference and mirrors.
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMPLOAD x nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMPMIRROR nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMPOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* NMOS differential input pair and mirrored tail current.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=2
XMNL nleft inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMNR nright inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Second gain stage.
XMNS out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Miller compensation.
CCOMP x out 3p
.ends dut
