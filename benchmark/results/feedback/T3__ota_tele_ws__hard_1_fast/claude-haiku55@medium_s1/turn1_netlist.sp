.subckt dut iref inp inn out
* Bias: 20 uA reference diode on iref (ideal source pushes current into the drain/gate node)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Tail mirror, 3x (60 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=3
* Second-stage sink mirror, 6x (120 uA)
XMS  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=6

* NMOS input pair (30 uA per side)
XM1  d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2  d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS current-mirror load (first stage)
XMP3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS common-source second stage (4x mirror ratio relative to MP4)
XMP5 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=4

* Miller compensation with nulling resistor
Rz d2 nx 2k
Cc nx out 0.55p
.ends dut
