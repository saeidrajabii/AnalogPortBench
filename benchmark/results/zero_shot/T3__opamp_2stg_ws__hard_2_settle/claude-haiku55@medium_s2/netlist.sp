.subckt dut iref inp inn out
* ---- Bias: diode-connected reference driven by iref (20 uA) ----
XMNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.0 nf=1 m=1
* ---- Tail mirror: 2x reference = 40 uA ----
XMNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.0 nf=1 m=1
* ---- Second-stage sink mirror: 5x reference = 100 uA ----
XMNS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1
* ---- First stage: NMOS diff pair (20 uA each) with PMOS mirror load ----
XMN1 n08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP0 n08 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
* ---- Second stage: PMOS common-source driver with NMOS current sink ----
XMP2 out n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.5 nf=1 m=1
* ---- Miller compensation with nulling resistor (as in source) ----
RR0 n08 n012 3k
CC0 n012 out 500f
.ends dut
