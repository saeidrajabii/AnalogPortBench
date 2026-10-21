.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* branch A (10 uA): vbp1 diode + resistor offset -> vbp2
XMPbA vbp1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
RbA vbp1 vbp2 30k
XMNbA vbp2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* branch B (10 uA): NMOS cascode gate
XMPbB vbnc vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XMNbB vbnc vbnc nb 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
RbB nb 0 28k
* ---------------- Stage 1: NMOS-input folded cascode ----------------
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1 nf=1 m=1
XM1 f1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XM2 f2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XMT1 f1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.7 nf=1 m=4
XMT2 f2 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.7 nf=1 m=4
XMC1 a vbp2 f1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMC2 o1 vbp2 f2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMNc3 a vbnc b1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNm3 b1 a 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMNc4 o1 vbnc b2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNm4 b2 a 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
* ---------------- Stage 2: PMOS CS with cascoded NMOS sink ----------------
XMP6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13 L=0.5 nf=1 m=8
XMN8 out vbnc s8 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=6
XMN7 s8 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=6
* ---------------- Miller compensation with nulling resistor ----------------
Rz o1 xc 1.3k
Cc xc out 0.5p
.ends dut
