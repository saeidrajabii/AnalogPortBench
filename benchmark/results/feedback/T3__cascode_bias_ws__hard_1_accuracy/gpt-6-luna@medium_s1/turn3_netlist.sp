.subckt dut iin out vb1 vb2 vb3 vb4
  * NMOS reference and output sink mirror
  XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1
  XNSINK out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1

  * NMOS-mirrored current sets the PMOS reference branch
  XNPMREF p_ref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1
  XPREF p_ref p_ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=20 nf=1 m=1
  XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=20 nf=1 m=1

  * Drive the remaining bias outputs at the corresponding bias voltages.
  RPB vb1 vb2 1m
  RNB vb3 vb4 1m
.ends dut
