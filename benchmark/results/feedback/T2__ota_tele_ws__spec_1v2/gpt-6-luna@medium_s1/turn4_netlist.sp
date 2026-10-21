.subckt dut iref inp inn out
* NMOS reference sink and mirrored tail current
XMNREF  iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMNTAIL tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* PMOS bias generator, biased by the reference-current mirror
XMPBIAS vb_p  vb_p  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMNBIAS vb_p  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Differential input stage with PMOS mirror load
XMNINP  x1    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1
XMNINN  x2    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1
XMPD    x1    x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=3 nf=1 m=1
XMPM    x2    x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=3 nf=1 m=1

* Second gain stage
XMNSOUT out   x2    0     0     sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XMPSOUT out   vb_p  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=3 nf=1 m=1

* Miller compensation
CCOMP   x2    ncomp 500f
RCOMP   ncomp out   3k
.ends dut
