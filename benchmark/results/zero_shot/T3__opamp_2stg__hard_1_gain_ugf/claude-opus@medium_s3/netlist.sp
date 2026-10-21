.subckt dut iref inp inn out
* ---------------- bias ----------------
* iref -> R1 -> NMOS diode : vbn ; iref node = NMOS cascode bias
R1    iref vbn 13k
XMB1  vbn  vbn  0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
* 5uA leg: PMOS diode (vbp) -> R2 -> vbpc -> NMOS sink
XMB2  vbpc vbn  0   0   sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
R2    vbp  vbpc 52k
XMB3  vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.25 L=0.5 nf=1 m=1
* ---------------- stage 1: folded cascode ----------------
XMT   tail vbn  0    0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
XM1   fx   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=15 L=0.3 nf=1 m=1
XM2   fy   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=15 L=0.3 nf=1 m=1
XMP3  fx   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=3.25 L=0.5 nf=1 m=7
XMP4  fy   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=3.25 L=0.5 nf=1 m=7
XMP5  x    vbpc fx   vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMP6  y    vbpc fy   vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMN7  x    iref sx   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN8  y    iref sy   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN9  sx   y    0    0   sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMN10 sy   y    0    0   sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* ---------------- stage 2: NMOS common source ----------------
XMP11 out  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=3.25 L=0.5 nf=1 m=28
XMN12 out  x    0    0   sky130_fd_pr__nfet_01v8_lvt W=30 L=0.4 nf=1 m=1
* ---------------- Miller compensation with nulling resistor ----------------
RZ    x    nz   2.6k
CC    nz   out  0.4p
.ends dut
