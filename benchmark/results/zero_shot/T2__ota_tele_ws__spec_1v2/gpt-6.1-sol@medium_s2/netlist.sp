* SKY130 candidate port; performance requires verification with the supplied models.
.subckt dut iref inp inn out

* Reference-current mirror.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNBT bpt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNBO bpo iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Low-overdrive input-stage bias, nominally 50 uA.
XPBT bpt bpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.6 nf=1 m=1
XPT tail bpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=0.6 nf=1 m=1

* PMOS differential pair with source-connected isolated wells.
XPI1 nd inn tail tail sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XPI2 n1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* First-stage NMOS current-mirror load.
XNL1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XNL2 n1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* Separate output-stage bias, nominally 140 uA.
XPBO bpo bpo vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.8 nf=1 m=1
XPO out bpo vdd vdd sky130_fd_pr__pfet_01v8_lvt W=98 L=0.8 nf=1 m=1
XNO out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=44.8 L=0.8 nf=1 m=1

* Miller compensation with series zero-control resistor.
RZ n1 nc 1k
CC nc out 1.15p

.ends dut
