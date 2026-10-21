.subckt dut iref inp inn out
* The 20 uA reference current is converted to a voltage before mirroring.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.8 nf=1 m=1

* Nominal 60 uA input-pair tail current and 100 uA output sink.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=54 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=0.8 nf=1 m=1

* NMOS differential input pair with a PMOS current-mirror load.
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.7 nf=1 m=1
XINN y inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.7 nf=1 m=1
XLOADD y y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.8 nf=1 m=1
XLOADM x y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.8 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.8 nf=1 m=1
RNULL x cc 450
CCOMP cc out 1.3p
.ends dut
