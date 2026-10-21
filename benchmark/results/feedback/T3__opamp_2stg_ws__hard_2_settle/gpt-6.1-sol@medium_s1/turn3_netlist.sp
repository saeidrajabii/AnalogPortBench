.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBP vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

* Cascode bias dividers.
RNC1 vdd vnc 80k
RNC2 vnc 0 120k
RPC1 vdd vpc 175k
RPC2 vpc 0 25k

* Differential input stage.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMNINP fold_r inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=0.9 nf=1 m=1
XMNINN fold_l inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=0.9 nf=1 m=1

* Folded-branch current sources.
XMPSL fold_l vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=4
XMPSR fold_r vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=4

* Folding cascodes.
XMPFL mirror_node vpc fold_l vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XMPFR gain_node vpc fold_r vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1

* Cascoded NMOS current-mirror load.
XMNNL mirror_source mirror_node 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1.25 nf=1 m=1
XMNNR gain_source mirror_node 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1.25 nf=1 m=1
XMNCL mirror_node vnc mirror_source 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1
XMNCR gain_node vnc gain_source 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1

* Output gain stage.
XMPOUT out gain_node vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=7
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7

* Miller compensation and phase-lead zero.
RZ gain_node comp_node 3k
CC comp_node out 1.1p

.ends dut
