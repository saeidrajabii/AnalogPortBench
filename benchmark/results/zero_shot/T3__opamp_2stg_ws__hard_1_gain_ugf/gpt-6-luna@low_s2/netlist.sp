.subckt dut iref inp inn out
* Reference-current sink and scaled NMOS current sinks
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XMN2BIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* PMOS bias branch for the second-stage current source
XMPBIAS vbias vbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNBIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XMNINP nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMNINN nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPLOADL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPLOADR nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XMNS2 out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPS2 out vbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
CCOMP nright out 500f
.ends dut
