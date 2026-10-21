.subckt dut iref inp inn out
* Bias reference: 20 uA into the diode-connected device on iref
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* Tail mirror, 3x (60 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=3
* Second-stage sink mirror, 6x (120 uA)
XMS  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=6

* NMOS input pair (30 uA per side); inp drives the output-side device (non-inverting)
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XM2  d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* PMOS current-mirror load (first stage)
XMP3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS common-source second stage: W/L 4x MP4 (120 uA), short L to limit gate capacitance
XMP5 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4

* Miller compensation with nulling resistor (zero placed near unity-gain frequency)
Rz d2 nx 5k
Cc nx out 0.33p
.ends dut
