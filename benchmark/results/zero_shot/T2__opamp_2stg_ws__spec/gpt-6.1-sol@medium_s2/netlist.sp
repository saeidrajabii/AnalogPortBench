.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1

* Input-stage tail current and output-stage sink current.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=5
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=8

* Mirrored branch generating the PMOS cascode-gate bias.
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5.6 L=0.35 nf=1 m=1
RBIAS pbias pcbias 10k
XMNBIAS pcbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1

* NMOS differential pair.
XMNINP drive inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1.2 nf=1 m=1
XMNINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1.2 nf=1 m=1

* PMOS mirror with a cascoded output branch.
XMPDIO mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.35 nf=1 m=1
XMPMIR pstack mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.35 nf=1 m=1
XMPCAS drive pcbias pstack vdd sky130_fd_pr__pfet_01v8_lvt W=56 L=0.35 nf=1 m=1

* Common-source output stage.
XMPOUT out drive vdd vdd sky130_fd_pr__pfet_01v8_lvt W=84 L=0.35 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZ drive comp 1k
CC comp out 1.25p

.ends dut
