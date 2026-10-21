.subckt dut iref inp inn out
* Reference current and NMOS current mirrors
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XNPBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNCBIAS nlow iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* PMOS current-source bias
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* NMOS cascode bias
XPCBIAS ncb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XNCUP ncb ncb nlow 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNCLOW nlow nlow 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1

* Differential input pair and NMOS cascodes
XNINP ndp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XNINN ndn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XNCASP pcg ncb ndp 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XNCASN out ncb ndn 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* Diode-connected left PMOS cascode establishes the right cascode bias
XPLEFT psleft pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPCLEFT pcg pcg psleft vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XPRIGHT psright pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPCRIGHT out pcg psright vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
.ends dut
