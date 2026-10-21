.subckt dut iref inp inn out
* Reference-current sink and mirrored bias currents.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS differential input pair with NMOS current-mirror load.
XMP1 n1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP2 n2 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMN2 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Second gain stage and its PMOS current-source load.
XMN3 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPREF pbi pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPBIAS pbi iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPLOAD out pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Miller compensation.
CCOMP n2 out 300f
.ends dut
