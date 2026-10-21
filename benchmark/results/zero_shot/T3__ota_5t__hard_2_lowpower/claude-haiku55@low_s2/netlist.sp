.subckt dut iref inp inn out
* Reference diode (iref sinks the 20 uA reference through a diode-connected NMOS)
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail current mirror, 1:1 ratio gives ~20 uA tail
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* NMOS differential pair, inp on the diode-connected (mirror-input) side
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* inn on the output side, so out is non-inverting with respect to inp
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS current-mirror load
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP2 out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
