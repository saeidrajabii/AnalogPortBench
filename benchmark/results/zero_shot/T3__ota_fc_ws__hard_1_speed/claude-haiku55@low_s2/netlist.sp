.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
* Reference diode: iref carries 20 uA, gate voltage is the NMOS bias
XMBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail mirror: 5x reference = 100 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Fold-branch NMOS sinks: 20 uA each
XNS1 z1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XNS2 z2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS bias: diode-connected PMOS sets vbp, fed by NMOS mirror of iref (20 uA)
XMNM vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XPD vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS cascode bias vbnc (~2 Vgs): 20 uA PMOS source into two stacked diodes
XPB1 vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNA vbnc vbnc w1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XNB w1 w1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS cascode bias vbpc: 20 uA PMOS source into one NMOS diode
XPB2 vbpc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XND vbpc vbpc 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---------------- Signal path ----------------
* Top PMOS current sources: 70 uA each
XPS1 x1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XPS2 x2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1

* NMOS input pair (50 uA each)
XIP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XIN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Left fold branch (dummy, carries 20 uA)
XPC1 y1 vbpc x1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNC1 y1 vbnc z1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Right output branch
XPC2 out vbpc x2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNC2 out vbnc z2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Tail mirror output current sinks for input pair are the tail device XMT
.ends dut
