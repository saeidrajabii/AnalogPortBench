.subckt dut iref inp inn out
* Bias: 20 uA reference diode MNref (W=2), tail mirror MNtail (W=4, 2x = 40 uA),
* second-stage sink MNsink (W=10, 5x = 100 uA). Reference enters a drain, never a source.
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* First stage: NMOS differential pair (inp drives the mirror-output side, so the
* overall path is non-inverting), PMOS diode load MP1 and mirror MP0.
XMN1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second stage: PMOS common-source MP2 with NMOS current sink MNsink.
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNsink out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor (same values as the source design).
CC0 net012 out 500f m=1
RR0 net08 net012 3k m=1
.ends dut
