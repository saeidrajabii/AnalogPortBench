.subckt dut iin out vb1 vb2 vb3 vb4
  XNREF   iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
  XNPMREF vb1  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
  XPREF   vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
  XNSINK  out  vb3  0    0    sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
  XPSOURCE out  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
  Rvb12 vb1 vb2 1m
  Rvb3i vb3 iin 1m
  Rvb34 vb3 vb4 1m
.ends dut
