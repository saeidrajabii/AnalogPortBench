.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=0.8 nf=1 m=1

* PMOS current-source bias.
XMNBP bp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=0.8 nf=1 m=1
XMPREF bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS cascode bias.
XMPBN bn bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNBN bn bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.8 L=0.6 nf=1 m=1

* PMOS folding-cascode bias.
XMNBPC bpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=0.8 nf=1 m=1
XMPBPC bpc bpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1

* Input pair and mirrored tail current.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=0.8 nf=1 m=4
XMNINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=0.6 nf=1 m=1
XMNINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=0.6 nf=1 m=1

* Folded-branch sources maintain current during input steering.
XMPTOPP foldp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=94 L=0.5 nf=1 m=1
XMPTOPN foldn bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=94 L=0.5 nf=1 m=1

* Folding cascodes; longer output device increases output resistance.
XMPFOLDP mirror bpc foldp vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XMPFOLDN out bpc foldn vdd sky130_fd_pr__pfet_01v8_lvt W=53.333 L=1 nf=1 m=1

* Cascoded output-current mirror.
XMNMIRP ns_p mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNMIRN ns_n mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNCASP mirror bn ns_p 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMNCASN out bn ns_n 0 sky130_fd_pr__nfet_01v8_lvt W=26.667 L=1 nf=1 m=1

.ends dut
