.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows through the NMOS diode stack.
* vb4 mirrors it into the PMOS bias leg; both output branches are cascoded.
XNR1 iin iin vb4 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XNR0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
RVB3 iin vb3 1

XNB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XPR1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XPR0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1

XNO0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XNO1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XPO1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XPO0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
.ends dut
