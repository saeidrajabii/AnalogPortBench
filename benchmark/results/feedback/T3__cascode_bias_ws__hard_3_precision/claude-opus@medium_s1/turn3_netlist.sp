.subckt dut iin out vb1 vb2 vb3 vb4
* bias port vb4 tied to the reference node (unloaded, carries no DC current)
R0 iin vb4 1

* ---- NMOS reference branch: Iin enters the drain of a cascoded replica ----
XNI2 iin vb3 ni 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30
XNI1 ni vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30

* ---- vb2: PMOS cascode-gate bias (low-W/L PMOS diode fed by NMOS mirror) ----
XN6 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30
XP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=139 L=2.5 nf=1 m=1

* ---- vb3: NMOS cascode-gate bias (low-W/L NMOS diode fed by PMOS copy) ----
XP5 vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=139 L=2.5 nf=1 m=1
XN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=2.5 nf=1 m=1

* ---- vb1: PMOS cascoded replica driven by NMOS cascoded replica ----
XNR2 vb1 vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30
XNR1 nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30
XP2 vb1 vb2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=2.5 nf=1 m=60
XP3 pr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=2.5 nf=1 m=60

* ---- output: NMOS cascode sink + PMOS cascode source ----
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=30
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=2.5 nf=1 m=60
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=2.5 nf=1 m=60
.ends dut
