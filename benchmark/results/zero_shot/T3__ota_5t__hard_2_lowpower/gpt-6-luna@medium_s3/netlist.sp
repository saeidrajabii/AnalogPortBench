.subckt dut iref inp inn out
* 20 uA reference sink and 1:2 NMOS tail-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1.5 nf=1 m=1
XTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* NMOS differential pair
XMN1 n9 inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XMN2 out inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1

* PMOS current-mirror load
XMP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=2 nf=1 m=1
XMP2 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=2 nf=1 m=1
.ends dut
