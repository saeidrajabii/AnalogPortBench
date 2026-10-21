* Best-effort single-stage OTA. The requested performance cannot be guaranteed
* from the supplied information: no SKY130 model data or simulation results
* are provided to verify gain, phase margin, settling, swing, or saturation.

.subckt dut iref inp inn out
* Reference-current sink and NMOS current mirror.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* NMOS differential pair.
XM1 nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XM2 nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS current-mirror active load; nright is the output node.
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Output buffer stage. Its bias is derived from the mirrored reference.
XMB out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPB out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
.ends dut
