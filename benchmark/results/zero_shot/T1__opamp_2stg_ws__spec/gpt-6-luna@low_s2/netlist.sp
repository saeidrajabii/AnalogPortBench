.subckt dut iref inp inn out
* Reference-current sink and mirrored tail current
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS bias generator, fed by a mirrored reference-current sink
XMNBIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPBIAS vbP vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPBIASSINK vbP nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XMNINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage
XMNOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMPOUT out vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Miller compensation
CCOMP n2 out 2p
.ends dut
