.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS bias branch, set by the reference-current NMOS mirror
XMPBIAS pbi pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNBP pbi iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XMNINL nl inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNINR nr inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPLOADR x nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Common-source output stage with PMOS current-source load
XMNOUT out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMPOUT out pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Miller compensation
CCOMP x out 0.5p
.ends dut
