.subckt dut iref inp inn out
* The reference current enters a diode-connected NMOS and is mirrored
* into the input-pair tail and the second-stage load.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30.8 L=1 nf=1 m=1
XLOAD out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30.8 L=1 nf=1 m=1

* Differential first stage with a PMOS current-mirror load.
XINP vx inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XINN pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XPDI pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPMIR vx pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Common-source output stage and series-RC compensation.
XOUT out vx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
RZ vx comp 2k
CC comp out 1.4p
.ends dut
