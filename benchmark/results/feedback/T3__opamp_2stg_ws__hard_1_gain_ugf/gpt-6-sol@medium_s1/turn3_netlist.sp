.subckt dut iref inp inn out
* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=95 L=0.7 nf=1 m=1

* Cascode biases. The PMOS cascode bias is raised to increase
* the drain-source voltage across XPSRC.
RNC_TOP vdd ncas 36k
RNC_BOT ncas 0 204k
RPC_TOP vdd pcas 112k
RPC_BOT pcas 0 128k
ROC_TOP vdd ocas 96k
ROC_BOT ocas 0 144k

* Differential input stage and cascoded active load.
XINM pref inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.55 nf=1 m=1
XINP nd inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.55 nf=1 m=1
XNC ng ncas nd 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=1.2 nf=1 m=1
XPREF pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XPSRC ps pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.2 nf=1 m=1
XPC ng pcas ps vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.2 nf=1 m=1

* Reduce output-stage gate capacitance while increasing its
* transconductance.
XPOUT out ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=500 L=0.5 nf=1 m=1
XOSINK ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.7 nf=1 m=1
XOC out ocas ns 0 sky130_fd_pr__nfet_01v8_lvt W=115 L=1.2 nf=1 m=1

* Miller compensation with a left-half-plane series zero.
RZ ng comp 9k
CC comp out 250f
.ends dut
