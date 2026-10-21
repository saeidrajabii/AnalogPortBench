.subckt dut iref inp inn out
* Diode-connected reference device; the reference current is mirrored
* into the differential-pair tail.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL ns   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2

* NMOS differential pair with a PMOS current-mirror load.
XINP  nd  inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XINN  out inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XPREF nd  nd  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPOUT out nd  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
