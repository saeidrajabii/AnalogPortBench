.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS mirror reference.
XMNPR pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Level-shifted NMOS cascode bias.
XMPNB bn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNBD bn bn nsb 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
RNB nsb 0 15k

* Level-shifted PMOS cascode bias.
RPB vdd psb 15k
XMPBD bp bp psb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XMNPB bp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* NMOS differential input pair and mirrored tail current.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
XMNINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS folded branches and current-mirror load.
XMPTOPL foldp mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPTOPR foldn mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPCASL mirror bp foldp vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XMPCASR out bp foldn vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Cascoded NMOS branch-current sinks.
XMNLOWL nl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNLOWR nr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNCASL mirror bn nl 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMNCASR out bn nr 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1

.ends dut
