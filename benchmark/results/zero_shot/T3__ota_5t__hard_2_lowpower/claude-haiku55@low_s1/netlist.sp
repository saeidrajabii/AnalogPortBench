.subckt dut iref inp inn out
* Reference: diode-connected NMOS sinks the 20 uA ideal current from iref
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Tail: 1/2 ratio mirror (W/L = 40 vs 80), so about 10 uA
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS differential pair
XMN2 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* PMOS current-mirror load (n9 is the diode side)
XMP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP0 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
.ends dut
