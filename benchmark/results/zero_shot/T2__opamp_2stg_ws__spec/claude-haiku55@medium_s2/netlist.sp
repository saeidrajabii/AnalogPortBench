.subckt dut iref inp inn out
* Bias: iref is the diode-connected drain/gate of the reference NMOS (no current enters a source).
* The reference gate voltage (node iref) is mirrored to the tail and output-sink devices.
XMREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load.
* inp drives the output-side device (non-inverting); inn drives the diode-side device (inverting).
XMDIO  ndio ndio vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMMIR  nout ndio vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMINP  nout inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMINN  ndio inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Second stage: PMOS common-source driver with NMOS current sink (about 200 uA).
XMS2P  out nout vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMS2N  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Miller compensation with nulling resistor (nout -> R -> nz -> C -> out).
R1 nout nz 2k
C1 nz out 0.6p
.ends dut
