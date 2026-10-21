.subckt dut iref inp inn out
* Mirror the 20 uA reference into the input tail and output-stage sink.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP  gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XINN  mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XPMD  mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XPMO  gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1

* Common-source output stage with Miller compensation.
XOUT  out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.6 nf=1 m=1
RZ    gain comp 700
CC    comp out 500f
.ends dut
