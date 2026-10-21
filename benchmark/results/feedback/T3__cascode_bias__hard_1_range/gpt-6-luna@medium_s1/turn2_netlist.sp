.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference current and matched sink branches.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XNLOAD nref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1

* Diode-connected PMOS reference and matched output source.
XPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=20 nf=1 m=1
XPSOURCE out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=20 nf=1 m=1

* Bias outputs; the large resistors leave the reference nodes effectively unloaded.
RVB12 vb1 vb2 1G
RVB1 vb1 nref 1
RVB34 vb3 vb4 1G
RVB3 vb3 iin 1
.ends dut
