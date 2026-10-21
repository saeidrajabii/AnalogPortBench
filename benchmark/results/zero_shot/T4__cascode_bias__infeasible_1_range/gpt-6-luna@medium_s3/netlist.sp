.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and matched output sink
XMNR   iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=2000 L=5 nf=1 m=1
XMNOUT out  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=2000 L=5 nf=1 m=1

* PMOS reference branch, sunk by the NMOS reference mirror
XMNPM  vb1  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=2000 L=5 nf=1 m=1
XMPREF vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4000 L=5 nf=1 m=1
XMPOUT out  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4000 L=5 nf=1 m=1

* Provide the remaining bias outputs as unloaded copies
RPTIE vb1 vb2 1u
RNTIE vb3 vb4 1u
.ends dut
