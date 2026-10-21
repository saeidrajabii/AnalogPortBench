.subckt dut iref inp inn out
* The 20 uA reference is converted to a diode-connected NMOS bias
* current, then mirrored to the input-pair tail.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1 nf=1 m=1

* PMOS bias branch and output-stage current source.
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=2 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=52.5 L=2 nf=1 m=1

* Differential first stage with a PMOS current-mirror load.
XNI mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=2 nf=1 m=1
XNP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=2 nf=1 m=1
XPM mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1
XPL gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XNO out gain 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=2 nf=1 m=1
RZ gain comp 1.4k
CC comp out 1.5p
.ends dut
