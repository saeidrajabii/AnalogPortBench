.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode: 20 uA from vdd into iin
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Tie vb4 to iin (near-short; 1 mOhm)
Rv vb4 iin 1m

* ---- vb3 generation (NMOS cascode gate) ----
* Replica bottom NMOS (gate vb4), drain X
XMr2 X vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Diode-connected NMOS cascode replica, drain=gate=vb3, source X
XMc vb3 vb3 X 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS current source into vb3, gate vb1
XMs vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* ---- vb1 generation (PMOS top mirror gate) ----
* PMOS diode from vdd into vb1
XMd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* NMOS sink from vb1, gate vb4
XMm vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- vb2 generation (PMOS cascode gate) ----
* PMOS replica of top device (gate vb1), drain Y
XMr1 Y vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS diode-connected cascode replica, source Y, drain=gate=vb2
XMd2 vb2 vb2 Y vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* NMOS sink from vb2, gate vb4
XMn2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- Output NMOS cascode sink (to ground) ----
XMn0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMn2c out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- Output PMOS cascode source (from vdd) ----
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
.ends dut
