.subckt dut iref inp inn out
* The reference current establishes an NMOS gate bias; the OTA tail mirrors it at 1:2.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP load inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XPDI load load vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XPMIR out load vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
.ends dut
