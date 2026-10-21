.subckt dut iref inp inn out
* ---------------- bias ----------------
* reference diode (20 uA) and tail mirror (40 uA)
XMB1 iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=16
XMT  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=32
* 5 uA sink for the PMOS-cascode bias replica
XMS  vcp  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=4
* vcp = VDD - I*RP - Vsg(replica)  ->  y1,y2 = VDD - 0.18 V
RP1  vdd  sp1  36k
XMBP vcp  vcp  sp1  sp1  sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.6 nf=1 m=2
* degenerated replica mirror feeding the NMOS-cascode bias (5 uA)
RP2  vdd  sp2  36k
XMPC vcn  vcp  sp2  sp2  sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.6 nf=1 m=2
* vcn = Vgs(replica) + I*RN  ->  x1,x2 = 0.34 V
XMBN vcn  vcn  sn   sn   sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
RN   sn   0    68k
* ---------------- telescopic OTA ----------------
XM1  x1   inp  tail tail sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=16
XM2  x2   inn  tail tail sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=16
XM3  d1   vcn  x1   x1   sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
XM4  out  vcn  x2   x2   sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
XM5  d1   vcp  y1   y1   sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=6
XM6  out  vcp  y2   y2   sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=6
XM7  y1   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=6
XM8  y2   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=6
.ends dut
