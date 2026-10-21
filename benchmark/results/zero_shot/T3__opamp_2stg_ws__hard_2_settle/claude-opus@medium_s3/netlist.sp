.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
* NMOS mirror reference: iref flows through RB1 into the drain of diode MNB0.
* Node iref sits at vbn + 20uA*15k, which gives about 0.3 V across each NMOS current source.
RB1   iref vbn 15k
XMNB0 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* PMOS cascode bias: diode PMOS (10 uA) minus a 0.3 V resistor drop.
XMNB1 vbpc vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
RB2   pd vbpc 30k
XMPB0 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* ---------------- Stage 1: NMOS pair, low-voltage cascode PMOS mirror load ----------------
XMT   ntail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=3
XMN1  net9  inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=4
XMN2  net08 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=4
XMP1T a1 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP1C net9 vbpc a1 a1 sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP2T a2 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP2C net08 vbpc a2 a2 sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* ---------------- Stage 2: PMOS common source, cascoded NMOS sink ----------------
XMPO  out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=16
XMNOC out iref nsk 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=12
XMNOB nsk vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=12

* ---------------- Miller compensation with nulling resistor ----------------
RZ    net08 nz 700
CC    nz out 0.7p
.ends dut
