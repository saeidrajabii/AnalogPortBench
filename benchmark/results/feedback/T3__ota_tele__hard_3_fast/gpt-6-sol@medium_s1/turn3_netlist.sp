.subckt dut iref inp inn out
* Convert the reference current to a gate bias, then mirror it.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Cascode-gate biases
RNT vcn vdd 400k
RNB vcn 0 800k
RPT vcp vdd 560k
RPB vcp 0 440k

* Differential input pair and NMOS cascodes
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XNC1 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XNC2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* Current-mirror load with an output cascode
XPL1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1 nf=1 m=1
XPL2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1 nf=1 m=1
XPC2 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.35 nf=1 m=1
.ends dut
