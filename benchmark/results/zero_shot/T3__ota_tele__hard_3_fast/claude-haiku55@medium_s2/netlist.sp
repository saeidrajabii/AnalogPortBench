.subckt dut iref inp inn out
* Reference mirror: MB1 is diode-connected on iref, MT mirrors 4.5x (about 90 uA tail)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1

* NMOS input pair (about 45 uA per side)
XM1 e1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 e2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS cascodes (gate vbn3 = 0.75 V)
XM3 d1  vbn3 e1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 out vbn3 e2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS mirror load (gates on d1) with PMOS cascodes (gate vbp3 = 0.4 V)
XMP1 a   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP2 b   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP3 d1  vbp3 a   vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP4 out vbp3 b   vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Cascode bias dividers (about 1.5 uA total)
Rbn1 vdd  vbn3 600k
Rbn2 vbn3 0    1M
Rbp1 vdd  vbp3 1M
Rbp2 vbp3 0    500k
.ends dut
