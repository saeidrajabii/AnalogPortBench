.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current is sunk by a diode-connected NMOS.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=2 nf=1 m=1

* A second NMOS mirrors the reference into the PMOS bias branch.
XNB pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=2 nf=1 m=1
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=2 nf=1 m=1

* Output current sink and source.
XNO out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=2 nf=1 m=1
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=2 nf=1 m=1

* Unloaded bias-voltage outputs.
RVB1 vb1 pbias 1
RVB2 vb2 pbias 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
