.subckt dut in out
* The reference current flows through two diode-connected devices.
XREF_C in in bias bias sky130_fd_pr__nfet_01v8_lvt W=2000 L=1 nf=1 m=1
XREF_B bias bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1

* A narrower output cascode is intended to lower the output compliance voltage.
XOUT_B mid bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XOUT_C out in mid mid sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
.ends dut
