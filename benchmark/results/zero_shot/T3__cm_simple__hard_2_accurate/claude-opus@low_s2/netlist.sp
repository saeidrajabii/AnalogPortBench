.subckt dut in out
* Reference branch: M1 mirror device, Mc1 cascode, Mc1's drain closes the diode loop at in
XM1  a   in  0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1   nf=1 m=1
XMc1 in  vb  a 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Output branch: M0 mirror device, Mc0 regulated cascode
XM0  x   in  0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1   nf=1 m=1
XMc0 out g   x 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Bias current derived from in, then mirrored by a PMOS
XMns p1  in  0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPd  p1  p1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPm  vb  p1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* vb generator: a weak diode, so a = Vgs(Mb1) - Vgs(Mc1), about 0.1 V
XMb1 vb  vb  0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
* Two-stage amplifier: PMOS input pair forces x = a and drives g
XPt  t   p1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP1  d1  a   t   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP2  d2  x   t   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XN3  d1  d1  0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN4  d2  d1  0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN5  g   d2  0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XP6  g   p1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
