.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=4 nf=1 m=1

* PMOS differential input stage with an NMOS mirror load.
XPT ps pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=4 nf=1 m=1
XPI n1 inp ps vdd sky130_fd_pr__pfet_01v8_lvt W=144 L=4 nf=1 m=1
XPM nd inn ps vdd sky130_fd_pr__pfet_01v8_lvt W=144 L=4 nf=1 m=1
XND nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=1
XNL n1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=1

* Common-source output stage and Miller compensation.
XPO out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=840 L=4 nf=1 m=1
XNO out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=168 L=4 nf=1 m=1
RZ n1 nc 1k
CC nc out 1.5p
.ends dut
