.subckt dut iin out vb1 vb2 vb3 vb4
  XNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=250 L=5 nf=1 m=1
  XNSINK vb1  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=250 L=5 nf=1 m=1
  XPREF  vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=500 L=5 nf=1 m=1

  XNOUT  out  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=250 L=5 nf=1 m=1
  XPOUT  out  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=500 L=5 nf=1 m=1

  RVB1   vb1  vb2  1
  RVB3   vb3  vb4  1
  RVB4   vb4  iin  1
.ends dut
