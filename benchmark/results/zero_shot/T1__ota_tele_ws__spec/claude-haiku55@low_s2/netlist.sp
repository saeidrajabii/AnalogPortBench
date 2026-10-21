.subckt dut iref inp inn out
* ---------- bias reference and tail ----------
* iref drives the drain/gate of a diode-connected NMOS (no current into a source)
XMNr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* tail = 2x reference, about 40 uA
XMNt tn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* ---------- cascode gate bias (~1.2 V) and PMOS load bias (~1.22 V) ----------
Rbn1 vdd vbcn 50k
Rbn2 vbcn 0 100k
Rbp1 vdd vbp 32k
Rbp2 vbp 0 68k

* ---------- NMOS input pair and cascodes ----------
XMN1 n1 inp tn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2 n2 inn tn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNC1 x1 vbcn n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNC2 out vbcn n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---------- PMOS load: diode-connected mirror with series current sources ----------
* left: diode-connected PMOS (drain=gate=x1), source at p1
XMPd x1 x1 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMPlp p1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* right: mirror PMOS driving out, source at p2
XMPm out x1 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMPmp p2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
