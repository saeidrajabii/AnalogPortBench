.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
* NMOS diode reference: iref (20 uA) sets Vgs for mirrors
XMBn iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source: 5x mirror -> 100 uA
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS bias: diode PMOS sourcing 20 uA into pb, pb sunk by NMOS mirror of iref
XMPbd pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNbs pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---------------- Stage 1: NMOS pair, PMOS mirror load ----------------
* inn on diode side, inp on output side (so inp is non-inverting overall
* after the inverting second stage)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---------------- Stage 2: NMOS common source, PMOS current source ----------------
XM5 out d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM6 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---------------- Miller compensation with nulling resistor ----------------
Rz d2 cz 1.7k
Cc cz out 1.5p
.ends dut
