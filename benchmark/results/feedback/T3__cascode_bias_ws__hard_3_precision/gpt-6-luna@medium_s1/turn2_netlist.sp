.subckt dut iin out vb1 vb2 vb3 vb4
* 20 uA NMOS reference diode and NMOS output mirror
XNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=20
XNOUT  out  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=20

* PMOS reference bias and matched PMOS output mirror
XPMREF vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=5 nf=1 m=20
XNPMREF vb1 iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=20
XPOUT  out  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=5 nf=1 m=20

* Additional unloaded bias outputs
XPMB2  vb2  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=5 nf=1 m=20
XNPMB2 vb2  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=20
XPMB3  vb3  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=5 nf=1 m=20
XNNB3  vb3  vb3  0    0    sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=20
XPMB4  vb4  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=5 nf=1 m=20
XNNB4  vb4  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=20
.ends dut
