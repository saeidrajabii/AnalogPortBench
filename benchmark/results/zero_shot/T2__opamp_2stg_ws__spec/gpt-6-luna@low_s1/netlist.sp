.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirrors
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNB nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS bias reference; its current is set by the NMOS mirror
XPBR vbiasp vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XNBR vbiasp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential input stage with PMOS mirror load
XND1 nd1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XND2 nd2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPL1 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPL2 nd2 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage and PMOS current-source load
XNS2 out nd2 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XPS2 out vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Miller compensation
RCOMP nd2 ncomp 3k
CCOMP ncomp out 500f
.ends dut
