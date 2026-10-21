.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and bias branches
XM4  iin   iin   0     0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM6  net1  iin   0     0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM7  net2  iin   0     0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM12 vb2   vb2   net1  0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM11 vb1   vb1   net2  0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM8  vb3   vb3   0     0     sky130_fd_pr__nfet_01v8_lvt W=8 L=3.0 nf=1 m=1
XM9  vb4   vb3   net10 0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM10 net10 vb4   0     0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS bias branches
XP3  net13 vb1   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP2  vb1   vb2   net13 vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP4  vb2   vb2   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=3.5 nf=1 m=1
XP7  net5  vb1   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP6  vb3   vb2   net5  vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP11 net6  vb1   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP10 vb4   vb2   net6  vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Cascode output sink and source
XM0  nsrc  vb4   0     0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM2  out   vb3   nsrc  0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP1  psrc  vb1   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP0  out   vb2   psrc  vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
