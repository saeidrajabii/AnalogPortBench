.subckt dut iref inp inn out
* Mirror the 20 U00B5A reference into the differential-pair tail.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2.0 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=46 L=2.0 nf=1 m=1

* Wider input devices increase transconductance and lower the tail-node
* voltage, providing more drain-source headroom for XTAIL.
XINP  pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.55 nf=1 m=1
XINN  out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.55 nf=1 m=1
XPREF pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XPOUT out pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
.ends dut
