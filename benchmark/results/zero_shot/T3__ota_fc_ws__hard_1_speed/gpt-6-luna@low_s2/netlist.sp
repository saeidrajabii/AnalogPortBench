.subckt dut iref inp inn out
* Reference-current sink and 10:1 tail-current mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS differential pair
XMNP ntail inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMNN out inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS current-mirror load
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMPLOAD out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMPLEFT nref inp ns vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.7 nf=1 m=1
.ends dut
