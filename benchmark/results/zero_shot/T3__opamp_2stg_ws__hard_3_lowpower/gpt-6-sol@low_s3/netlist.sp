.subckt dut iref inp inn out
* The 20 uA reference is converted to a diode-connected NMOS bias,
* then mirrored into the input tail and second-stage current sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=1

* Differential first stage with a PMOS current-mirror load.
XINM pm_diode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.65 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.65 nf=1 m=1
XPMD pm_diode pm_diode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=1.2 nf=1 m=1
XPMM stage1 pm_diode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=1.2 nf=1 m=1

* Common-source second stage and Miller compensation.
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
RZ stage1 comp 1.5k
CC comp out 650f
.ends dut
