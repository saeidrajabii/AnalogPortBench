.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS bias reference: nominally 20 uA.
XMNPREF pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* NMOS folded-cascode bias with source-voltage replica.
XMPNBC nb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMNNBC nb nb nrep 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
RNREP nrep 0 9k

* PMOS wide-swing cascode bias with source-voltage replica.
RPREP vdd prep 9k
XMPPCB pc pc prep vdd sky130_fd_pr__pfet_01v8_lvt W=13.714286 L=0.35 nf=1 m=1
XMNPCB pc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS input-pair supply: nominally 70 uA.
XMPTAIL tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=210 L=0.5 nf=1 m=1

* Differential input pair.
XMPINP fp inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XMPINN fn inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1

* Folding-node sinks: nominally 70 uA each.
XMNSP fp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1 nf=1 m=1
XMNSN fn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1 nf=1 m=1

* Folded common-gate branches: nominally 35 uA each.
XMNCGP mirror nb fp 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.5 nf=1 m=1
XMNCGN out nb fn 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.5 nf=1 m=1

* Wide-swing cascoded PMOS current-mirror load.
XMPML pmleft mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMPMR pmright mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMPCL mirror pc pmleft vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XMPCR out pc pmright vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1

.ends dut
