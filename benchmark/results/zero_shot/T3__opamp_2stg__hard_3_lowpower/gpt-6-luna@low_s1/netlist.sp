.subckt dut iref inp inn out
* 20 uA reference sink and NMOS current mirrors
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMTAIL tail_bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS bias branch; its current is set by a mirrored NMOS sink
XMBIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPBIAS nbias nbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load
XMNINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNINN nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMPLOADL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPLOADR nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=3
XMPOUT out nbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=3

* Miller compensation
RCOMP nright ncomp 3k
CCOMP ncomp out 2p
.ends dut
