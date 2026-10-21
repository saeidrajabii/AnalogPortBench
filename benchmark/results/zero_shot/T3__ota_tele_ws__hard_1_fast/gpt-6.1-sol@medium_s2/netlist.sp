* Candidate SKY130 port using a folded-cascode OTA.
* Numerical compliance requires verification with the testbench models.

.subckt dut iref inp inn out

* Reference-current mirror: the reference enters a drain/gate node.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Generate the PMOS current-source bias.
XMNBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XMPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1

* NMOS cascode bias: matched gate voltage plus resistive offset.
XMPBN bncas pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
RBN bncas bnbase 10k
XMNBN bnbase bnbase 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.714286 L=0.8 nf=1 m=1

* PMOS folded-cascode bias.
XMPBC bpbase bpbase vdd vdd sky130_fd_pr__pfet_01v8_lvt W=11.428571 L=0.5 nf=1 m=1
RBP bpbase bpcas 20k
XMNBC bpcas iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1

* Differential input pair and mirrored tail current.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=5
XMNINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMNINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Upper branch current sources.
XMPSP foldp pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=17 L=0.8 nf=1 m=4
XMPSN foldn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=17 L=0.8 nf=1 m=4

* PMOS folding devices.
XMPFP mirror bpcas foldp vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPFN out bpcas foldn vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Wide-swing cascoded NMOS current mirror.
XMNCL mirror bncas nleft 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMNML nleft mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XMNCR out bncas nright 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMNMR nright mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

.ends dut
