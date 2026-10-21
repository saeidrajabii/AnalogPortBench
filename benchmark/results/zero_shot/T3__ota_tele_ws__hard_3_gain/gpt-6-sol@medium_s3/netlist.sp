.subckt dut iref inp inn out
* Reference current is received at a diode-connected NMOS and mirrored
* into the PMOS bias generator.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=5 nf=1 m=1

* PMOS differential input stage with an NMOS mirror load.
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
XPI1 nd inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=1
XPI2 nx inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=1
XNL nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=1
XNRL nx nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XPO out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=5 nf=1 m=1
XNO out nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=5 nf=1 m=1
RZ nx nc 1k
CC nc out 0.7p
.ends dut
