.subckt dut iin out vb1 vb2 vb3 vb4
* Tie vb4 to the reference node (ideal 1 mOhm short)
Rtie iin vb4 1m

* Reference diode: 20 uA from iin sets vb4
XMr iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* NMOS sink (MN0) and cascode (MN2)
XMn0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMn2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* vb3 pin: NMOS diode carrying 20 uA from PMOS current source (gate vb1)
XMb3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
XMpb3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1

* vb2 pin: PMOS diode from vdd, sunk by NMOS mirror of vb4
XMb2p vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.6 L=0.5 nf=1 m=1
XMb2n vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* vb1 pin: PMOS diode from vdd, sunk by NMOS mirror of vb4
XMr1p vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMr1n vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* PMOS source (MP1) and cascode (MP0)
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
.ends dut
