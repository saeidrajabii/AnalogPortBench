.subckt dut iref inp inn out
* Reference-current NMOS and mirrored differential-pair tail current.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* NMOS differential pair; left branch drives the PMOS mirror reference.
XMNINL nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMNINR out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* PMOS current-mirror load.
XMPREF nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMPMIR out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
.ends dut
