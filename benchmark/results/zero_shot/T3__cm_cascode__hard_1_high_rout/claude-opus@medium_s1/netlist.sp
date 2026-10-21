.subckt dut in out
* ---- core mirror: bottom pair matched, drains forced equal (x2 = x1) ----
XM1 x1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XM2 x2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
* input-side cascode (gate at vc), output-side regulated cascode (gate g4)
XM3 in vc x1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM4 out g4 x2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* ---- bias derived from Iref: 5 uA into PMOS diode ----
XM5 vbp in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* ---- cascode gate bias: vc = Vgs(MB) + Ib*R2, sets x1 ~ 0.14 V ----
XMPC vc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB vc vc sb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
R2 sb 0 28k

* ---- stage 1: PMOS diff pair (low input common mode), NMOS mirror load ----
XMPT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMPA d1 x2 tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPBB o1 x1 tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XML1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XML2 o1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* ---- stage 2: NMOS common source, PMOS load -> wide swing on g4 ----
XMC g4 o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPL g4 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
Cc o1 g4 1p
.ends dut
