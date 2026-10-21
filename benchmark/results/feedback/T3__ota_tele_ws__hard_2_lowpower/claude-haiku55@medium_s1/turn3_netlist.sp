.subckt dut iref inp inn out
* ---- Bias: NMOS diode reference (20 uA into iref) and tail mirror (40 uA) ----
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=145 L=2.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=290 L=2.5 nf=1 m=1

* ---- Input pair (tail at source) ----
XM1 nL inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=198 L=2.5 nf=1 m=1
XM3 nO inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=198 L=2.5 nf=1 m=1

* ---- NMOS cascodes (gate vb5 = 0.73 V) ----
XM0 n82 vb5 nL 0 sky130_fd_pr__nfet_01v8_lvt W=145 L=2.5 nf=1 m=1
XM2 out vb5 nO 0 sky130_fd_pr__nfet_01v8_lvt W=145 L=2.5 nf=1 m=1

* ---- PMOS telescopic load ----
* Mirror devices (gate n82): short length and higher overdrive to cut gate capacitance
XP0 nLp n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=89 L=1.5 nf=1 m=1
XP2 nRp n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=89 L=1.5 nf=1 m=1
* Cascodes (gate vb2 = 0.5 V): long length for output resistance
XP1 n82 vb2 nLp vdd sky130_fd_pr__pfet_01v8_lvt W=333 L=2.5 nf=1 m=1
XP3 out vb2 nRp vdd sky130_fd_pr__pfet_01v8_lvt W=333 L=2.5 nf=1 m=1

* ---- Resistive bias dividers ----
Rb1 vdd vb5 392k
Rb2 vb5 0 608k
Rb3 vdd vb2 700k
Rb4 vb2 0 500k
.ends dut
