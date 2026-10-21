.subckt dut iref inp inn out
* ---------------- bias ----------------
* reference diode, 20 uA (W/L = 80)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* tail: 5x mirror of MB1 -> 100 uA (W/L total = 400)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=4
* PMOS bias: NMOS sinks 5 uA (W/L = 20), diode PMOS carries it
XMNB1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPB1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=1 nf=1 m=1

* NMOS cascode gate bias, vcn ~ 0.83 V
RVCN1 vdd vcn 980k
RVCN2 vcn 0 2.2Meg
CVCN vcn 0 10p

* ---------------- signal path ----------------
* PMOS current sources, 50 uA each (10x the 5 uA diode), no PMOS cascodes
XM5 d1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
XM6 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1

* NMOS cascodes
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* NMOS input pair (low overdrive)
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=0.5 nf=1 m=2
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=0.5 nf=1 m=2
.ends dut
