.subckt dut iref inp inn out
* NMOS reference-current sink and mirrored bias currents
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL  nt   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XSINK  out  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XINP   na   inp  nt   0    sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XINN   nb   inn  nt   0    sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XPMD   nb   nb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPMO   na   nb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Second gain stage and Miller compensation
XOUTP  out  na   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1
CCOMP  na   out  1p
RCOMP  na   ncomp 2k
.ends dut
