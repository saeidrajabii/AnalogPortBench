.subckt dut iref inp inn out
* A diode-connected reference device receives the 20 uA reference current.
* All other bias currents are supplied by mirrors.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Cascode-gate bias; the divider draws 10 uA from vdd.
RBH vdd nbcas 15k
RBL nbcas 0 105k

* NMOS differential pair and mirrored tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XINP pd inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=0.8 nf=1 m=1
XINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=0.8 nf=1 m=1
XNC1 n1 nbcas nd 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.5 nf=1 m=1

* PMOS mirror with a cascode on its high-gain output branch.
XPD pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.2 nf=1 m=1
XPM ps pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.2 nf=1 m=1
XPC n1 iref ps vdd sky130_fd_pr__pfet_01v8_lvt W=220 L=0.5 nf=1 m=1

* PMOS common-source output stage and cascoded NMOS current sink.
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=550 L=0.7 nf=1 m=1
XSN sn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=10
XSC out nbcas sn 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Miller compensation with a series nulling resistor.
RZ n1 nz 500
CC nz out 850f
.ends dut
