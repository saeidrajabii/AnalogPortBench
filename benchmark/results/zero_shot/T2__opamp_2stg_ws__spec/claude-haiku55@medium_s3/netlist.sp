.subckt dut iref inp inn out
* Bias: diode-connected reference (iref drives drain and gate, source to ground)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 2x reference (~40 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* Second-stage sink, 8x reference (~160 uA)
XMsink out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=8

* First stage: NMOS differential pair with PMOS mirror load
* inn drives the diode-side device, so the path inn -> out is inverting (unity-gain follower stable)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Second stage: PMOS common-source driven by d2, NMOS current sink
XMP5 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor (LHP zero to cancel the RHP zero)
RZ d2 nz 2k
CC nz out 500f
.ends dut
