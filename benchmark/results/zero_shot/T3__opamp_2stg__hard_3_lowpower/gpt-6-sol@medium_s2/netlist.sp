.subckt dut iref inp inn out
* The reference current enters a diode-connected NMOS and is mirrored
* into the differential-pair tail and the output-stage current sink.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=3 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=3 nf=1 m=1
XSINK out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=3 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=3 nf=1 m=1
XINN b inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=3 nf=1 m=1
XPD  b b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=3 nf=1 m=1
XPM  a b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=3 nf=1 m=1

* PMOS common-source output stage and Miller compensation.
XOUT out a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=3 nf=1 m=1
RNULL a comp 750
CCOMP comp out 600f
.ends dut
