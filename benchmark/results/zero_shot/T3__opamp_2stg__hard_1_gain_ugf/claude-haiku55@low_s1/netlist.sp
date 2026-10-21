.subckt dut iref inp inn out
* Bias: diode-connected reference (iref is the drain of MB1, not a source)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 2x reference (~40 uA)
XMB2 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Second-stage sink, 5x reference (~100 uA)
XMB3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
* inp drives the diode-side device, inn drives the output-side device,
* so the stage-1 output is non-inverting with respect to inn.
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second stage: PMOS common-source driven by n1, NMOS current sink from bias
XMP3 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
RZ n1 nz 3k
CC nz out 500f
.ends dut
