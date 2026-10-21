.subckt boost_amp inn inp o pb
* Two-stage boost amplifier with a PMOS input pair, because its inputs sit near 0.1 V.
* inn is the feedback input (diode side). When inn rises, o falls.
XMPT t   pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=1   nf=1 m=1
XMP1 d1  inn t   t   sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP2 o1  inp t   t   sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN3 d1  d1  0   0   sky130_fd_pr__nfet_01v8_lvt W=2  L=1   nf=1 m=1
XMN4 o1  d1  0   0   sky130_fd_pr__nfet_01v8_lvt W=2  L=1   nf=1 m=1
* Second stage: MN5 runs at the same current density as MN3, so systematic offset is near zero.
XMN5 o   o1  0   0   sky130_fd_pr__nfet_01v8_lvt W=4  L=1   nf=1 m=1
XMP6 o   pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=1   nf=1 m=1
CC   o   o1  0.5p
.ends boost_amp

.subckt dut in out
* Reference voltage of 0.1 V that sets the drain voltage of the bottom mirror devices
R1 vdd vref 1.1Meg
R2 vref 0   100k
* PMOS bias generator: Iref is mirrored down to about 4 uA
XMNB pb in 0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=1 nf=1 m=1
* Reference branch: Iref -> in -> MC1 -> x1 -> M1. A1 regulates x1 to vref.
XMC1 in  vg1 x1 0 sky130_fd_pr__nfet_01v8_lvt W=20  L=0.5 nf=1 m=1
XM1  x1  in  0  0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1   nf=1 m=2
XA1  x1  vref vg1 pb boost_amp
* Output branch: A2 forces x2 to equal x1, which gives a regulated cascode
XMC2 out vg2 x2 0 sky130_fd_pr__nfet_01v8_lvt W=20  L=0.5 nf=1 m=1
XM2  x2  in  0  0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1   nf=1 m=2
XA2  x2  x1  vg2 pb boost_amp
.ends dut
