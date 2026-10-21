.subckt dut iref inp inn out
* Reference current is converted to a diode-connected NMOS bias,
* then mirrored to the input-pair tail and output-stage current sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=4
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=7

* Differential first stage with a PMOS current-mirror load.
XINN pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XINP stage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPD pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XPM stage pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1

* Common-source output stage and series-null Miller compensation.
XOP out stage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.6 nf=1 m=1
RNULL stage comp 1.25k
CCOMP comp out 0.9p
.ends dut
