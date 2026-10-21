.subckt dut iref inp inn out

* Reference-current mirror.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* PMOS bias and input-pair tail current.
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=4

* NMOS common-gate bias.
XPBC ncas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XNC1 ncas ncas nbmid 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XNC0 nbmid nbmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* PMOS differential input pair.
XPI1 fold_l inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XPI2 fold_r inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.6 nf=1 m=1

* Folded-branch current sinks.
XNS1 fold_l iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=4
XNS2 fold_r iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=4

* NMOS folding cascodes.
XNF1 mirror_l ncas fold_l 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XNF2 out ncas fold_r 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPM1 pmid_l pmid_l vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XPC1 mirror_l mirror_l pmid_l vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XPM2 pmid_r pmid_l vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XPC2 out mirror_l pmid_r vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1

.ends dut
