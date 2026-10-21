.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current is drawn by a diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=20 nf=1 m=1

* Its mirror establishes the PMOS reference current.
XNBIA pb iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=20 nf=1 m=1
XPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6000 L=20 nf=1 m=1

* Single-device output mirrors minimize voltage headroom.
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=20 nf=1 m=1
XPOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6000 L=20 nf=1 m=1

* Unloaded bias outputs.
RVB1 vb1 pb 1
RVB2 vb2 pb 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
