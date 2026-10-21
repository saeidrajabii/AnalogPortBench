.subckt dut iref inp inn out
* Reference current is converted to a bias voltage before mirroring.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=5 nf=1 m=1

* Differential input stage with longer-channel mirror loads.
XNINV pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XNNON x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XPDIOD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=5 nf=1 m=1
XPMIR x pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=5 nf=1 m=1

* Longer-channel output stage with series-nullled Miller compensation.
XPOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=5 nf=1 m=1
RNULL x comp 5k
CCOMP comp out 0.75p
.ends dut
