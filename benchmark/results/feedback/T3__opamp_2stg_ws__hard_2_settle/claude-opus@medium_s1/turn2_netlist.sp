.subckt dut iref inp inn out
* ---------------- Reference: stacked NMOS diodes (iref only enters drain/gate) ----------------
XMB1 iref iref x 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB0 x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* ---------------- PMOS bias: vbp (sources) and vcp = vbp - 0.3V (cascodes), 10 uA ----------------
XMS1 vcp x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
RP vbp vcp 30k
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.35 nf=1 m=1

* ---------------- NMOS cascode bias: vcn = Vgs + 0.25V, 10 uA ----------------
XMPN vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.35 nf=1 m=1
RN vcn dn 25k
XMND dn dn 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* ---------------- Stage 1: NMOS pair, folded cascode ----------------
XMT tail x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
XM1 fb inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 fa inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* top PMOS current sources, 70 uA each
XMPA fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.35 nf=1 m=7
XMPBB fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.35 nf=1 m=7
* PMOS cascodes
XMCA d vcp fa vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.35 nf=1 m=4
XMCB o1 vcp fb vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.35 nf=1 m=4
* low-voltage cascoded NMOS mirror load
XMNCA d vcn na 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNA na d 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNCB o1 vcn nb 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNB nb d 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---------------- Stage 2: PMOS common source, cascoded NMOS sink (160 uA) ----------------
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=8
XM7 out iref nc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
XM8 nc x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8

* ---------------- Miller compensation with nulling resistor ----------------
RZ o1 nz 1.5k
CC nz out 0.7p
.ends dut
