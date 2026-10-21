.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS and PMOS mirror reference
XNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XNMIR  nref iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XPMREF nref nref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* PMOS cascode bias stack
XPBIAS1 vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XPBIAS2 vb2  vb2  vb1  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XNPSINK vb2  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* NMOS cascode bias stack
XPNSRC  vb3  nref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XNBIAU  vb3  vb3  vb4  0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XNBIAL  vb4  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* Output PMOS cascode source
XPOUTU  npsrc vb1 vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XPOUTL  out   vb2 npsrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Output NMOS cascode sink
XNOUTL  nnsrc vb4 0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XNOUTU  out   vb3 nnsrc 0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
