.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current enters the drain of the diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=30
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=93.7024 L=20 nf=1 m=30

* A reference-mirror branch supplies the PMOS diode-connected device.
XNCOPY vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=30
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=20 nf=1 m=30
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=192.864 L=20 nf=1 m=30

* The bias outputs are unloaded by the testbench.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
