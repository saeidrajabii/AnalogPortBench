.subckt dut iref inp inn out
* Mirror the 20 uA reference into the differential-pair tail.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Resistive bias for the NMOS cascodes.
RBC1 vdd vcn 100k
RBC2 vcn 0 140k

* Differential input pair and NMOS cascodes.
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.35 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.35 nf=1 m=1
XCN1 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XCN2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.35 nf=1 m=1

* PMOS current-mirror load.
XPL1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.2 nf=1 m=1
XPL2 out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.2 nf=1 m=1
.ends dut
