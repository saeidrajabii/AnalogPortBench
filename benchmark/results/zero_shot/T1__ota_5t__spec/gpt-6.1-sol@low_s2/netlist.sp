.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, nominal 5 uA bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1

* PMOS bias diode and nominal 36 uA differential-pair supply.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 m=1

* PMOS input pair accommodates the 0.5 V input common mode.
XINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
XINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1

* NMOS mirror load gives positive gain from inp to out.
XLOADREF mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XLOADOUT out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
.ends dut
