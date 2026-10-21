.subckt dut iref inp inn out
* ---- bias generation (1.2 V) ----
* reference: iref is drain+gate of NMOS diode (gives vbn1 = iref node, 20 uA)
XMRN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS bias: 15 uA sink through PMOS diode -> vbp1
XMPRN vbp1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMPRP vbp1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* cascode gate bias (vbn2 ~ 1.0 V, vbp2 ~ 0.4 V)
R1 vdd vbn2 200k
R2 vbn2 0 1M
R3 vdd vbp2 2M
R4 vbp2 0 1M

* ---- tail (20 uA, NMOS) ----
XMT T iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* ---- input pair (NMOS) ----
* X: fold node of inp branch, V: fold node/output-branch of inn branch
XM1 X inp T 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 V inn T 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* ---- top PMOS current sources (15 uA each) ----
XMP0 X vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 V vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* ---- PMOS cascodes ----
XMP4 Z vbp2 X vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP5 out vbp2 V vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* ---- NMOS cascodes and sinks (5 uA each) ----
XMN6 Z vbn2 Q 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN7 Q iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN9 out vbn2 U 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN8 U iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
