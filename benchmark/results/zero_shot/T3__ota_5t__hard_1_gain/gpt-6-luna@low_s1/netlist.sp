.subckt ota_5t vbiasn inp inn out
* NMOS differential pair; the inp branch is diode-connected through the PMOS mirror.
XMN1 net_tail inp net_inp 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMN2 out inn net_tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNT net_tail vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMP1 net_inp net_inp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XMP2 out net_inp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends ota_5t

.subckt dut iref inp inn out
* The reference current is sunk by a diode-connected device and mirrored to the OTA tail.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XIOTA iref inp inn out ota_5t
.ends dut
