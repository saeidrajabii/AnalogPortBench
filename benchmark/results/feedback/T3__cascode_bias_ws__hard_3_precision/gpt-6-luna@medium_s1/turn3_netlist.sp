.subckt dut iin out vb1 vb2 vb3 vb4
* Long-channel NMOS reference and output current mirror
XNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=12500 L=100 nf=1 m=20
XNOUT  out  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=12500 L=100 nf=1 m=20

* PMOS reference branch, biased by the NMOS reference mirror
XPMREF vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12500 L=100 nf=1 m=20
XNPMREF vb1 iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=12500 L=100 nf=1 m=20

* PMOS output current mirror
XPOUT  out  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12500 L=100 nf=1 m=20

* Unloaded auxiliary bias outputs
RVB2 vb2 vb1 1G
RVB3 vb3 vb1 1G
RVB4 vb4 vb1 1G
.ends dut
