.subckt dut iref inp inn out
* Bias: 20 uA reference (MB0, W=1) mirrored into tail (W=2, ~40 uA)
* and second-stage sink (W=4, ~80 uA).
XMB0  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=1   L=0.5 nf=1 m=1
* First stage: NMOS differential pair with PMOS current-mirror load
XMT   tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=2   L=0.5 nf=1 m=1
XM1   d1   inp  tail 0  sky130_fd_pr__nfet_01v8_lvt W=40  L=0.5 nf=1 m=1
XM2   d2   inn  tail 0  sky130_fd_pr__nfet_01v8_lvt W=40  L=0.5 nf=1 m=1
XMP3  d1   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8   L=0.5 nf=1 m=1
XMP4  d2   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8   L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink
XMP5  out  d2   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20  L=0.5 nf=1 m=1
XMN5  out  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=1
* Miller compensation with nulling resistor (d2 -> out)
Rc1   d2   ncc  1k
Cc1   ncc  out  1p
.ends dut
