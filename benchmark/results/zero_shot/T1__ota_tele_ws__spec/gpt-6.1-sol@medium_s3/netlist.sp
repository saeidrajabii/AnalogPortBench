.subckt dut iref inp inn out

* Reference-current receiver and NMOS current mirrors.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XNT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNBP pbref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
XNPC pcas iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1

* PMOS reference mirror supplies the NMOS cascode-bias stack.
XPR pbref pbref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPN ncas pbref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* NMOS cascode-bias stack.
XNCB ncas ncas nbottom 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNDB nbottom nbottom 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1

* PMOS cascode-bias stack.
XPCB ptop ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XPCD pcas pcas ptop vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1

* NMOS differential pair.
XNI1 ndleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XNI2 ndright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* NMOS cascodes.
XNC1 nmirror ncas ndleft 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XNC2 out ncas ndright 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPM1 psleft nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPM2 psright nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPC1 nmirror pcas psleft vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XPC2 out pcas psright vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1

.ends dut
