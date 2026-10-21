.subckt dut iin out vb1 vb2 vb3 vb4
  XNREF   vb3  vb3  0    0    sky130_fd_pr__nfet_01v8_lvt W=10000 L=50 nf=1 m=1
  XNPMREF vb1  vb3  0    0    sky130_fd_pr__nfet_01v8_lvt W=10000 L=50 nf=1 m=1
  XPREF   vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100000 L=50 nf=1 m=1
  XPSINK  out  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100000 L=50 nf=1 m=1
  XNSINK  out  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=10000 L=50 nf=1 m=1

  Rvb1_vb2 vb1 vb2 1m
  Rvb3_vb4 vb3 vb4 1m
.ends dut
