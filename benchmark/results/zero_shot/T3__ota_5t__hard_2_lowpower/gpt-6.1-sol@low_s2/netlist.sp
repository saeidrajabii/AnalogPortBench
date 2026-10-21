.subckt dut iref inp inn out
* Reference-current mirror: nominal auxiliary current 0.5 uA.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=1 nf=1 m=1

* PMOS bias mirror: nominal differential-pair current 10 uA.
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* PMOS differential pair and NMOS current-mirror load.
* Increasing inp reduces the output-branch sink current.
XPI mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPM out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XNL mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNO out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
.ends dut
