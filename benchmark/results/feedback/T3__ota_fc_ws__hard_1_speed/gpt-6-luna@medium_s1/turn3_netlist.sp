.subckt dut iref inp inn out
* Reference sink and tail-current mirror.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XNTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1

* Differential input pair and PMOS current-mirror load.
XMNREF nref inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XMNOUT out inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XMPMIR out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
.ends dut
