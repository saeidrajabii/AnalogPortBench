.subckt dut iref inp inn out
* ---- bias: iref -> stacked NMOS diodes ----
XMD2 iref iref nb1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMD1 nb1 nb1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* ---- stage 1: telescopic cascode, NMOS input ----
XMT tail nb1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMC1 n1 iref x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMC2 d1 iref x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP3C n1 nb1 s1 s1 sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XMP4C d1 nb1 s2 s2 sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XMP3 s1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP4 s2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* gain-setting resistor (no DC current at balance)
Rg d1 n1 12meg
* ---- stage 2: PMOS common source ----
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=12
XM6 out nr 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=12
* ---- replica bias for output sink (1/12 scale) ----
XM5R nr d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM6R nr nr 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---- Miller compensation ----
Rc n1 nc 500
Cc nc out 1.5p
.ends dut
