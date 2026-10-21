.subckt dut iref inp inn out
* Bias: 20 uA reference diode MNref, mirrored to a 30 uA PMOS tail via the MPb diode.
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNb  vpb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMPb  vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPt  tail vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS input pair (NMOS pair cannot bias at VCM = 0.5 V on a 1.2 V supply).
XMp1  d1  inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMp2  out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS current-mirror active load.
XMn1  d1  d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XMn2  out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
.ends dut
