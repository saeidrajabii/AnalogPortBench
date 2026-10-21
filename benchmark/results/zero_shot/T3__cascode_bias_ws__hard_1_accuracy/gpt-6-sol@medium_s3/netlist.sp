.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current diode and NMOS mirrors
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=10 nf=1 m=100
XNPREF pref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=10 nf=1 m=100
XNPD pd iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=10 nf=1 m=100

* PMOS mirror supplies the NMOS cascode-bias branch
XPREF pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=10 nf=1 m=200
XPNB vb3 pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=10 nf=1 m=200
RNB nb_res 0 3.75k
XND vb3 vb3 nb_res 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=10 nf=1 m=100

* PMOS cascode bias
RPB vdd pb_res 3.75k
XPD pd pd pb_res vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=10 nf=1 m=200

* Exposed bias outputs and cascoded output branches
RVB1 vb1 pref 1m
RVB2 vb2 pd 1m
RVB4 vb4 iin 1m
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=10 nf=1 m=100
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=10 nf=1 m=100
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=10 nf=1 m=200
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=10 nf=1 m=200
.ends dut
