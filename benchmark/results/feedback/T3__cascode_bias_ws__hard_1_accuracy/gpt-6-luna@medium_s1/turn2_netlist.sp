.subckt dut iin out vb1 vb2 vb3 vb4
  XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1
  XMNPD vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1
  XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=20 nf=1 m=1
  XMP0 out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=20 nf=1 m=1
  XMN0 out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1

  Rvb12 vb1 vb2 1G
  Rvb3i vb3 iin 1G
  Rvb34 vb3 vb4 1G
.ends dut
