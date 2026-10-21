.subckt dut in out
* ---- main mirror pair (identical Vgs, Vds forced equal by amplifier) ----
XM1 in  g 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XM2 out g 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2

* ---- matched 1/2 dividers (shift amp common mode into PMOS-pair range) ----
Rd1 in  ind  100Meg
Rd2 ind 0    100Meg
Rd3 out outd 100Meg
Rd4 outd 0   100Meg

* ---- bias (independent of Iref) ----
XMB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
RB  pb 0 160k

* ---- amplifier stage 1: PMOS pair, NMOS mirror load ----
XMT  tail pb  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=2  L=1   nf=1 m=1
XMP1 d1   outd tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP2 o1   ind  tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1 d1   d1   0    0    sky130_fd_pr__nfet_01v8_lvt W=2  L=1   nf=1 m=1
XMN2 o1   d1   0    0    sky130_fd_pr__nfet_01v8_lvt W=2  L=1   nf=1 m=1

* ---- amplifier stage 2: NMOS common source, PMOS load, drives gate g ----
XMN3 g  o1 0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
XMPL g  pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
CC   o1 g 2p
.ends dut
