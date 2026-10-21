* SKY130 LVT two-stage amplifier.
* Candidate sizing; specification compliance requires model-based simulation.

.subckt dut iref inp inn out

* Reference current sensing and NMOS mirror bias.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Mirrored reference branch generating the cascode bias.
XMNBGEN nbgen iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPBREF nbgen nbgen vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPBGEN vbcas nbgen vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNCB vbcas vbcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1

* NMOS differential input pair and PMOS mirror load.
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1
XMINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1
XMPLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS common-source output stage with cascoded NMOS sink.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.8 nf=1 m=1
XMNSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=7
XMNCAS out vbcas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=7

* Series-R Miller compensation.
RZERO nstage ncomp 750
CCOMP ncomp out 850f

.ends dut
