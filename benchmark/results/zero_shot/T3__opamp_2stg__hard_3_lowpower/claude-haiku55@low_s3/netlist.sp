.subckt dut iref inp inn out
* Bias: 20 uA reference (iref) mirrored to 20 uA (MNc->MPd PMOS bias),
* 40 uA tail (MNt), and 50 uA output-stage sink (PMOS current source MPcs).
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNc vp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMPd vp vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS mirror load.
* inn drives the diode-connected side (n1), inp drives the output side (o1),
* so the forward path inn->out is inverting and the unity-gain feedback is negative.
XMLd n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMLo o1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMDb n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMDa o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second stage: NMOS common source with PMOS current-source load.
XMCS out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMPcs out vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor (as in the source design).
RZ o1 cx 3k
CC cx out 500f
.ends dut
