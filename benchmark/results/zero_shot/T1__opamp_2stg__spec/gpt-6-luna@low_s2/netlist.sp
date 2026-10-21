.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNS2 ns2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XMNI1 n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNI2 n2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPI1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPI2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XMNS2G out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMPS2 vdd ns2 out vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
CCOMP n2 out 2p
.ends dut
