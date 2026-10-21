.subckt dut iref inp inn out
* Reference current is converted to an NMOS mirror bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=26 L=2.5 nf=1 m=1

* Differential input stage and PMOS mirror load.
XNINV pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.65 nf=1 m=1
XNNON x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.65 nf=1 m=1
XPDIOD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPMIR x pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Common-source output stage with Miller compensation.
XPOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=2.5 nf=1 m=1
RNULL x comp 1.8k
CCOMP comp out 1p
.ends dut
