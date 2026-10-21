.subckt dut iref inp inn out
* ---------------- Reference: stacked NMOS diodes (iref only enters drain/gate) ----------------
XMB1 iref iref x 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB0 x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
CDX x 0 1p
CDR iref 0 1p

* ---------------- PMOS bias: vbp (sources) and vcp = vbp - 0.3V (cascodes), 10 uA ----------------
XMS1 vcp x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
RP vbp vcp 30k
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13 L=0.7 nf=1 m=1
CDP vcp vdd 2p

* ---------------- NMOS cascode bias: vcn = Vgs + 0.3V, 10 uA ----------------
XMPN vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13 L=0.7 nf=1 m=1
RN vcn dn 30k
XMND dn dn 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.7 nf=1 m=1
CDN vcn 0 2p

* ---------------- Stage 1: NMOS pair (80 uA tail), folded cascode ----------------
XMT tail x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XM1 fb inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 fa inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* top PMOS current sources, 90 uA each
XMPA fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13 L=0.7 nf=1 m=9
XMPBB fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13 L=0.7 nf=1 m=9
* PMOS cascodes (50 uA each)
XMCA d vcp fa vdd sky130_fd_pr__pfet_01v8_lvt W=11.5 L=0.5 nf=1 m=4
XMCB o1 vcp fb vdd sky130_fd_pr__pfet_01v8_lvt W=11.5 L=0.5 nf=1 m=4
* low-voltage cascoded NMOS mirror load (50 uA each)
XMNCA d vcn na 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XMNA na d 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XMNCB o1 vcn nb 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XMNB nb d 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1

* ---------------- Stage 2: PMOS common source, cascoded NMOS sink (160 uA) ----------------
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=8
XM7 out iref nc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
XM8 nc x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8

* ---------------- Miller compensation with nulling resistor ----------------
RZ o1 nz 1.6k
CC nz out 0.6p
.ends dut
