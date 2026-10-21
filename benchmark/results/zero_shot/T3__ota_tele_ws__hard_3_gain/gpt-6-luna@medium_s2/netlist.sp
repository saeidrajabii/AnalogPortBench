.subckt dut iref inp inn out
* 20 uA reference and NMOS current mirrors
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=3.5 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3.5 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load
XMNINL nl inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=3.5 nf=1 m=1
XMNINR x inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=3.5 nf=1 m=1
XMPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=3.5 nf=1 m=1
XMPLOADR x nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=3.5 nf=1 m=1

* PMOS bias branch and second-stage load
XMNBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=3.5 nf=1 m=1
XMPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=3.5 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=56 L=3.5 nf=1 m=1

* Common-source second gain stage
XMNS2 out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=3.5 nf=1 m=1

* Miller compensation
RZ x ncomp 1.5k
CCOMP ncomp out 1p
.ends dut
