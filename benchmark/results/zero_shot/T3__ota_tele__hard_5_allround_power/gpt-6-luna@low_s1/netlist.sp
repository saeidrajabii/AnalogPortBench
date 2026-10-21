.subckt dut iref inp inn out
* NMOS reference mirror: the reference current enters a diode-connected drain.
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMT vbias vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XTAIL tail vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* Differential input pair and PMOS current-mirror load.
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPL n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPR n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS bias reference and scaled second-stage load.
XMB vbiasb vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XPB vbiasb vbiasb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XLOAD out vbiasb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13.33 L=0.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
CCOMP n2 out 500f
.ends dut
