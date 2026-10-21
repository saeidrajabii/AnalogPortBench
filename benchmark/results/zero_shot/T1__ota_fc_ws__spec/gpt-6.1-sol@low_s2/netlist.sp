.subckt dut iref inp inn out

* Reference-current mirror and NMOS cascode bias.
RBN iref vbn 10k
XNREF vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS cascode bias, driven by a mirrored reference current.
XNBP nbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
RBP vdd pbsource 7.5k
XPREF nbp nbp pbsource vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1

* Differential input pair and mirrored tail current.
XNTAIL tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XNINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XNINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1

* Folded PMOS current mirror.
XPMIRP foldp mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPMIRN foldn mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPCASP mirror nbp foldp vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XPCASN out nbp foldn vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Cascoded mirrored current sinks.
XNSINKP sinkp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNSINKN sinkn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNCASP mirror iref sinkp 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XNCASN out iref sinkn 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1

.ends dut
