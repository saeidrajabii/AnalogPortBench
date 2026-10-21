.subckt dut iref inp inn out
* 20 uA reference and scaled NMOS bias mirrors
XMREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMTAIL  ntail iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNBIAS pvb   iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNOUT  nout  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS bias reference and output-stage current source
XPMREF  pvb   pvb   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPMOUT  out   pvb   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Differential input stage; inn branch is diode/mirror reference
XMINN   n1    inn   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XMINP   n2    inp   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XMPL1   n1    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XMPL2   n2    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1

* Second gain stage
XMOUT   out   n2    0     0     sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Miller compensation
RZ      n2    ncomp 15k
CC      ncomp out   0.35p
.ends dut
