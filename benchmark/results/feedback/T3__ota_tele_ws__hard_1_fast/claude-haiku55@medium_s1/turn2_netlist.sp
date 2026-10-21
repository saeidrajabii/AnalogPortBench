.subckt dut iref inp inn out
* Bias reference: 20 uA into the diode-connected device on iref
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* Tail mirror, 4x (80 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=4
* Second-stage sink mirror, 6x (120 uA)
XMS  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=6

* NMOS input pair (40 uA per side). inp drives the output-side device, so inp->out is non-inverting.
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XM2  d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* PMOS current-mirror load (first stage)
XMP3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS common-source second stage, 3x MP4 width (120 uA at the same Vsg)
XMP5 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=3

* Miller compensation with nulling resistor
Rz d2 nx 2.5k
Cc nx out 0.4p
.ends dut
