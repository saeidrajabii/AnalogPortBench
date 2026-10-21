.subckt dut iref inp inn out

* Reference-current mirror and input-pair tail bias.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS differential input pair.
XMNINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMNINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Mirrored folding-branch supply currents.
XMPLOADP foldp pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21.6 L=1 nf=1 m=1
XMPLOADN foldn pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21.6 L=1 nf=1 m=1

* Passive cascode-gate bias generation.
RBP1 vdd pcas 900k
RBP2 pcas 0 900k
RBN1 vdd ncas 1.1meg
RBN2 ncas 0 700k
CBP pcas 0 2p
CBN ncas 0 2p

* PMOS folded cascodes.
XMPFOLDP mirror pcas foldp vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPFOLDN out pcas foldn vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Wide-swing cascoded NMOS current-mirror load.
XMNCASP mirror ncas sinkp 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNCASN out ncas sinkn 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNSINKP sinkp mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNSINKN sinkn mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

.ends dut
