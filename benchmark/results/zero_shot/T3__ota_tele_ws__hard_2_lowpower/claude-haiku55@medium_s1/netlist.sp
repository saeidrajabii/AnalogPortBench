.subckt dut iref inp inn out
* ---- Bias: NMOS diode reference (20 uA into iref) and tail mirror (40 uA) ----
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* ---- Input pair (tail at source) ----
XM1 nL inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XM3 nO inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1

* ---- NMOS cascodes (gate vb5 = 0.76 V) ----
XM0 n82 vb5 nL 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XM2 out vb5 nO 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* ---- PMOS telescopic load: mirror devices gated by n82, cascodes gated by vb2 (0.3 V) ----
XP0 nLp n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XP1 n82 vb2 nLp vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XP2 nRp n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XP3 out vb2 nRp vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* ---- Resistive bias dividers ----
Rb1 vdd vb5 367k
Rb2 vb5 0 633k
Rb3 vdd vb2 900k
Rb4 vb2 0 300k
.ends dut
