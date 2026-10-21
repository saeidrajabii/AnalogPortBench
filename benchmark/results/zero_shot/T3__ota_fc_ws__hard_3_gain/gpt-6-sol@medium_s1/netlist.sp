.subckt dut iref inp inn out
* The reference current is converted to a voltage by a diode-connected
* NMOS, then mirrored into the differential pair and output stage.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1.5 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XNINV pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XNNON x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XPDIOD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPMIR x pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Common-source output stage and series-nullled Miller compensation.
XPOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=1.5 nf=1 m=1
RNULL x comp 1.4k
CCOMP comp out 0.8p
.ends dut
