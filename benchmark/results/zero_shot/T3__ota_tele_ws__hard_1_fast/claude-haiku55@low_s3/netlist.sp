.subckt dut iref inp inn out
* Bias: 20 uA reference (MNref) mirrored to 100 uA tail (MNt) and 100 uA second-stage sink (MNs)
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=0.5 nf=1 m=1
XMNt   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNs   out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Input differential pair: inn on diode-side (x1), inp on output-side (x2)
XM1 x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS mirror load (diode on x1)
XMPa x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPb x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Second stage: PMOS common-source (gate x2) with NMOS current sink
XMP2 out x2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
Rz x2 cz 1k
Cc cz out 0.5p
.ends dut
