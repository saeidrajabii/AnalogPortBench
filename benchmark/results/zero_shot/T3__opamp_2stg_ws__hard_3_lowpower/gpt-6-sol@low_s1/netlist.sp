.subckt dut iref inp inn out
* The reference current is converted to a voltage by a diode-connected
* NMOS, then mirrored into the amplifier bias branches.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=3

* PMOS bias for the output-stage current source.
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPO out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=3

* NMOS differential input stage and PMOS current-mirror load.
XNI d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNF x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPL d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPM x d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Common-source output stage with series-RC Miller compensation.
XNO out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
RZ x cz 1.3k
CC cz out 600f
.ends dut
