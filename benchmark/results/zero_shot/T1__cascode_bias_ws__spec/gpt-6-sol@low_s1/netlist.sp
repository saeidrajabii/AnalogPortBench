.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current mirror
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNBIAS1 n1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNBIAS2 n2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS bias voltages
XNB1 vb1 vb1 n1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPB1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPB2 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

XNB2 vb2 vb2 n2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPB3 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 m=1

* NMOS bias voltages
XPB4 p2 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPB5 vb3 vb2 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XNB3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1

XPB6 p3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPB7 vb4 vb2 p3 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XNB4 n3 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNB5 vb4 vb3 n3 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Cascoded output source and sink
XPO1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPO2 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XNO1 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNO2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
