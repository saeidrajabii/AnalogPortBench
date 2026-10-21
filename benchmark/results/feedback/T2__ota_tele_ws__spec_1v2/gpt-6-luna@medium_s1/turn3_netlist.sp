.subckt dut iref inp inn out
* Reference current sink and NMOS current mirrors
XMNREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNTAIL  tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMNPSINK vb_p  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* PMOS bias current source
XMPREF   vb_p  vb_p  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Differential input stage; diode-connected branch is driven by inn
XMNINN   x1    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMNINP   x2    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPD     x1    x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPM     x2    x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Second gain stage
XMNSOUT  out   x2    0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPSOUT  out   vb_p  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* Miller compensation
CCOMP    x2    ncomp 1.2p
RCOMP    ncomp out   1k
.ends dut
