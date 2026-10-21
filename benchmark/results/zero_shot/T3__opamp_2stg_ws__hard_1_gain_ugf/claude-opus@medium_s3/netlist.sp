.subckt dut iref inp inn out
* ---------------- Bias generation (Iref = 20uA mirrored) ----------------
XMB0  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=1    nf=1 m=2
XMB1  vp   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=1    nf=1 m=1
XMB3  vpc  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=2   L=1    nf=1 m=1
XMPB0 vp   vp   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3   L=0.6  nf=1 m=2
* NMOS cascode bias (Vnc = Vgs + 5uA*44k)
XMPB1 vnc  vp   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3   L=0.6  nf=1 m=1
XMNB2 vnc  vnc  nr  0   sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5  nf=1 m=1
Rn    nr   0    44k
* PMOS cascode bias (Vpc = VDD - 5uA*60k - Vsg)
Rp    vdd  pr   60k
XMPB2 vpc  vpc  pr  vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.35 nf=1 m=1
* ---------------- Stage 1: NMOS-input folded cascode ----------------
XMT   tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=1    nf=1 m=4
XM1   fl   inn  tail 0  sky130_fd_pr__nfet_01v8_lvt W=16  L=0.4  nf=1 m=1
XM2   fr   inp  tail 0  sky130_fd_pr__nfet_01v8_lvt W=16  L=0.4  nf=1 m=1
XMP3  fl   vp   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3   L=0.6  nf=1 m=8
XMP4  fr   vp   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3   L=0.6  nf=1 m=8
XMP5  ol   vpc  fl  vdd sky130_fd_pr__pfet_01v8_lvt W=6   L=0.35 nf=1 m=1
XMP6  o1   vpc  fr  vdd sky130_fd_pr__pfet_01v8_lvt W=6   L=0.35 nf=1 m=1
XMN7  ol   vnc  bl  0   sky130_fd_pr__nfet_01v8_lvt W=6   L=0.5  nf=1 m=1
XMN8  o1   vnc  br  0   sky130_fd_pr__nfet_01v8_lvt W=6   L=0.5  nf=1 m=1
XMN9  bl   ol   0   0   sky130_fd_pr__nfet_01v8_lvt W=3.2 L=0.4  nf=1 m=1
XMN10 br   ol   0   0   sky130_fd_pr__nfet_01v8_lvt W=3.2 L=0.4  nf=1 m=1
* ---------------- Stage 2: NMOS common source, PMOS current-source load ----------------
XMN11 out  o1   0   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.4  nf=1 m=6
XMP12 out  vp   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3   L=0.6  nf=1 m=30
* ---------------- Miller compensation with nulling resistor ----------------
Rz    o1   cz   2.2k
Cc    cz   out  0.4p
.ends dut
