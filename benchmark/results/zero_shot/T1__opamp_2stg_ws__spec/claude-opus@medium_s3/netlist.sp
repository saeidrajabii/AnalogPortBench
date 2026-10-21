* ---------------- Bias generator ----------------
.subckt bias_gen iref vb3 vb4 vbp
* reference diode: 20 uA = 4 unit cells of 5 uA
XMN4  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2   L=2   nf=1 m=4
* 5 uA into PMOS diode
XMN6  nb1  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2   L=2   nf=1 m=1
XMP4  nb1  nb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4   L=2   nf=1 m=1
* vb3 : NMOS cascode gate (weak long diode)
XMP7  vb3  nb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4   L=2   nf=1 m=1
XMN8  vb3  vb3  0    0   sky130_fd_pr__nfet_01v8_lvt W=1   L=2   nf=1 m=1
* vb4 : wide-swing cascode current-source reference (5 uA unit)
XMP11 vb4  nb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4   L=2   nf=1 m=1
XMN9  vb4  vb3  nx   0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMN10 nx   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1   nf=1 m=1
* vbp : PMOS cascode gate (weak long PMOS diode, 5 uA)
XMN13 vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2   L=2   nf=1 m=1
XMP12 vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1   L=1.8 nf=1 m=1
.ends bias_gen

* ---------------- Two-stage op-amp ----------------
.subckt opamp_2stg vb3 vb4 vbp vm vout vp
* input pair, tail = 10 units = 50 uA
XMN1 n08  vp   n10 0   sky130_fd_pr__nfet_01v8_lvt W=40  L=0.5  nf=1 m=1
XMN2 n9   vm   n10 0   sky130_fd_pr__nfet_01v8_lvt W=40  L=0.5  nf=1 m=1
XMN3 n10  vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1    nf=1 m=10
* PMOS mirror load
XMP1 n9   n9   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.2 L=0.35 nf=1 m=1
XMP0 n08  n9   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.2 L=0.35 nf=1 m=1
* second stage: PMOS gm device + PMOS cascode, NMOS cascode sink 25 units = 125 uA
XMP2 nc   n08  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60  L=0.35 nf=1 m=1
XMPC vout vbp  nc  vdd sky130_fd_pr__pfet_01v8_lvt W=40  L=0.35 nf=1 m=1
XMN5 vout vb3  n1  0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5  nf=1 m=25
XMN4 n1   vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1    nf=1 m=25
* Miller compensation with nulling resistor
RZ n08 nz 3k
CC nz vout 0.8p
.ends opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 vbp bias_gen
XI1 vb3 vb4 vbp inn out inp opamp_2stg
.ends dut
