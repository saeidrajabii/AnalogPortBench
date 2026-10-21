.subckt dut iref inp inn out
* Single-ended telescopic-style OTA for SKY130 at VDD = 1.2 V.
* Input pair M1/M2 (NMOS, tail-biased), NMOS cascodes on a 0.8 V gate,
* PMOS diode-connected load on the inp branch mirrored to out.
* Bias: NMOS diode on iref (20 uA), tail mirror 8x (160 uA),
* PMOS current-source bias generated from a 20 uA diode branch.

* --- Bias generation ---
* NMOS reference diode (iref is the diode drain/gate, sources to ground)
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.7 L=0.5 nf=1 m=1
* NMOS tail mirror, 8x reference
XMNt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=53.6 L=0.5 nf=1 m=1
* NMOS sink that sets the PMOS bias branch to 20 uA
XMNbp vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.7 L=0.5 nf=1 m=1
* PMOS diode providing the PMOS current-source gate voltage vbp
XMPr vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8.9 L=0.5 nf=1 m=1

* NMOS cascode gate voltage (~0.8 V) from resistor divider
Rv1 vdd vnc 50k
Rv2 vnc 0 100k

* --- Signal path ---
* PMOS current sources (80 uA each)
XMPs1 P1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35.6 L=0.5 nf=1 m=1
XMPs2 P2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35.6 L=0.5 nf=1 m=1

* PMOS diode-connected load on the inp branch (node A) and mirror to out
XMPd1 A A P1 vdd sky130_fd_pr__pfet_01v8_lvt W=35.6 L=0.5 nf=1 m=1
XMPo out A P2 vdd sky130_fd_pr__pfet_01v8_lvt W=35.6 L=0.5 nf=1 m=1

* NMOS input pair (80 uA each from tail)
XM1 X1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=0.5 nf=1 m=1
XM2 X2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=0.5 nf=1 m=1

* NMOS cascodes
XMNc1 A vnc X1 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=0.5 nf=1 m=1
XMNc2 out vnc X2 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=0.5 nf=1 m=1
.ends dut
