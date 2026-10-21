.subckt dut iref inp inn out
* Reference-current input and scaled NMOS current sinks
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XMTAIL tailbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1.5 nf=1 m=1
XMSTAGE2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XMBP bpbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.25 L=1.5 nf=1 m=1

* PMOS bias reference and second-stage current-source load
XMPBIAS bpbias bpbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMPLOAD out bpbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5.33 L=1.5 nf=1 m=1

* NMOS differential input pair
XMNP x1 inp tailbias 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XMNN x2 inn tailbias 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* PMOS current-mirror load
XMPD x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=1.5 nf=1 m=1
XMPM x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=1.5 nf=1 m=1

* Miller compensation
CCOMP x2 comp 1p
RCOMP comp out 3k
.ends dut
