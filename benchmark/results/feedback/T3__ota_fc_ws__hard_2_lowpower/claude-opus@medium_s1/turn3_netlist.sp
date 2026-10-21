.subckt dut iref inp inn out
* ---------- reference mirror (20 uA, 2.5 uA per unit) ----------
XMNR  iref  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=8
* tail 15 uA
XMTL  ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=6
* ---------- stage 1: NMOS pair, PMOS mirror load ----------
XMNA  d1 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=8
XMNB  o1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=8
XMP3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=3
XMP4  o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=3
* ---------- stage 2: PMOS common source, NMOS sink 35 uA ----------
XMP6  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=14
XMN7  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=14
* ---------- Miller compensation with nulling resistor ----------
Rz  o1 nc 5k
Cc  nc out 1.05p
.ends dut
