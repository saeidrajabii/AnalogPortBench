.subckt dut iref inp inn out
* Reference current is converted to a voltage, then mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS bias mirror: 40 uA nominal input-pair tail and
* 80 uA nominal second-stage load.
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=1
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=2
XPL out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=4

* Differential first stage with NMOS current-mirror load.
XPI nd inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPM ni inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XNL ni ni 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.2 nf=1 m=1
XNM nd ni 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation.
XNO out nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.2 nf=1 m=1
RC nd nc 1k
CC nc out 0.7p
.ends dut
