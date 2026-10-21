* SKY130 LVT port candidate; specification compliance requires simulation.
.subckt dut iref inp inn out

* Reference-current receiver and NMOS mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Generate a PMOS mirror bias.
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Generate the output NMOS cascode gate bias.
XPCBIAS vcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XNCBIAS vcas vcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Differential input stage with a mirrored 40-uA tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.8 nf=1 m=1
XPLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage with a cascoded mirrored sink.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XNSINK sink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XNCAS out vcas sink 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.6 nf=1 m=1

* Series-R Miller compensation.
RCOMP stage1 comp 3k
CCOMP comp out 650f

.ends dut
