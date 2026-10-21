* SKY130 candidate; specification compliance requires model-based verification.
.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1

* Low-current branch generating the output cascode bias.
XMNBREF pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1.2 nf=1 m=1
XMPBREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
XMPBCAS vcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
XMNCREF vcas vcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.45 L=1.2 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=2
XMNINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.2 nf=1 m=1
XMNINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.2 nf=1 m=1
XMPDIO mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XMPLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* Common-source output stage with a cascoded mirrored current sink.
XMPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.2 nf=1 m=1
XMNOUT casnode iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=4
XMNCAS out vcas casnode 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=4

* Series-R Miller compensation.
RCOMP stage1 comp 3k
CCOMP comp out 750f

.ends dut
