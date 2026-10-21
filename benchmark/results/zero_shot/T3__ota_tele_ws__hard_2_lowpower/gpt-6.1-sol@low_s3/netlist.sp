* Candidate low-voltage, two-stage OTA with Miller compensation.
* Device sizing requires TT model simulation and optimization:
* compliance with the numerical specifications is not verified.
* Reference current is mirrored; it enters only a diode-connected drain.

.subckt dut iref inp inn out

* NMOS reference and mirrored PMOS-bias generation.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=1 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS differential pair, nominal tail current 20 uA.
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPI nx inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XPM nd inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* NMOS current-mirror load.
XND nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XNL nx nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Inverting second stage, nominal quiescent current 40 uA.
XNO out nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1

* Series-R Miller compensation; external load is supplied by testbench.
RZ nx nc 2k
CC nc out 0.9p

.ends dut
