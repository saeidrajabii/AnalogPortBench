.subckt dut iref inp inn out
* 20 uA reference mirror; tail current is twice the reference
XMREF   iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=5  L=1.0 nf=1 m=1
XMTAIL  tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.0 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load
XMNINP  n1    inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMNINN  n2    inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMPL1   n1    n1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMPL2   n2    n1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* PMOS bias reference and mirrored output-stage source current
XMPSINK pb    iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=5  L=1.0 nf=1 m=1
XMPREF  pb    pb    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMPOUT  out   pb    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=8

* Second gain stage and Miller compensation
XMNS2   out   n2    0    0    sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
RZ      n2    ncomp 1k
CC      ncomp out  500f
.ends dut
