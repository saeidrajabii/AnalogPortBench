.subckt dut iref inp inn out
* Diode-connected reference and 1.5:1 NMOS tail-current mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.0 nf=1 m=1
XMNTAIL tail_bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=1.0 nf=1 m=1

* NMOS differential pair
XMNINP net9 inp tail_bias 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XMNINN out inn tail_bias 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1

* PMOS active-load current mirror
XMPREF net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XMPLOAD out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
.ends dut
