.subckt dut iref inp inn out
* Reference sink and 5:1 tail-current mirror.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input pair with PMOS current-mirror load.
XMNREF nref inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.2 nf=1 m=1
XMNOUT out inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.2 nf=1 m=1
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XMPMIR out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1
.ends dut
