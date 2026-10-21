.subckt dut iref inp inn out
* 1:1 reference-current mirror; iref current flows through the diode-connected device.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential pair.
XMNINP nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNINN out inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS current-mirror active load.
XMPREF nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPLOAD out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
