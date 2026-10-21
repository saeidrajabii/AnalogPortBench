.subckt dut iref inp inn out
* Reference current is converted to a voltage before being mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=2 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

* PMOS differential pair and NMOS current-mirror load.
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XPI x inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPN nd inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XND nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=2 nf=1 m=1
XNM x nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=2 nf=1 m=1

* Common-source output stage and Miller compensation.
XPO out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72.5 L=2.5 nf=1 m=1
XNO out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=27.5 L=2.5 nf=1 m=1
RZ x cz 2.4k
CC cz out 2p
.ends dut
