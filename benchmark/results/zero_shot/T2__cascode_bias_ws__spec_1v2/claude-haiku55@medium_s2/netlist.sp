.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode: 20 uA set by the ideal source into iin
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* vb1: PMOS diode (gate=drain=vb1) fed by an NMOS mirror leg of iin
XMpd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMl1  vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* vb2: PMOS replica of the source (gate vb1) + PMOS diode + NMOS sink leg
XMprep w vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMpd2  vb2 vb2 w vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMl2   vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* vb4: PMOS current (gate vb1) into NMOS diode
XMpl4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMnd4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* vb3: PMOS current (gate vb1) into NMOS diode stacked on an NMOS replica of the sink (gate vb4)
XMpl3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMnd3 vb3 vb3 x 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMrep x vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Output NMOS cascode sink
XMn0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMn2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Output PMOS cascode source
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
.ends dut
