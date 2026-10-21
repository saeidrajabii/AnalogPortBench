.subckt dut iref inp inn out
* Reference and bias devices
XMNREF  iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=4  L=1.5 nf=1 m=1
XMNPMB  vb_p  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=4  L=1.5 nf=1 m=1
XMNT    tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNBIAS2 ns2  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPREF  vb_p  vb_p  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=4  L=1.5 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XMNINP  x1    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNINN  x2    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPD    x1    x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMPM    x2    x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Output stage and compensation
XMNSOUT out   x2    0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPSOUT out   vb_p  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
CCOMP   x2    ncomp 3.3p
RCOMP   ncomp out   1k
.ends dut
