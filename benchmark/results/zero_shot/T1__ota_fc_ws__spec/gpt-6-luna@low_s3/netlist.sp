.subckt dut iref inp inn out
* Reference diode and mirrored tail-current source
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* NMOS differential input pair
XMINP nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMINN nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* PMOS current-mirror load
XMPD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPM nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Single-ended output branch
XMOUT out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMPOUT out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
.ends dut
