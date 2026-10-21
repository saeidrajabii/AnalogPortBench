.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate bias before mirroring.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=1

* NMOS differential input stage and PMOS current-mirror load.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=6
XINP nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XINN nstage inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPDI nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XPMI nstage nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1

* Common-source output stage with series-RC Miller compensation.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=6
RZ nstage ncomp 1k
CC ncomp out 1.2p
.ends dut
