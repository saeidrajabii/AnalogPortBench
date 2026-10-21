.subckt dut iref inp inn out
* ---------------- bias generation ----------------
* 20 uA reference mirror: iref is drain and gate of the diode device
XMref  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* 20 uA sink that loads the PMOS diode (cascode gate bias vbp)
XMsnk  vbp  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMpd   vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=0.5 nf=1 m=1
* 20 uA PMOS source feeding the NMOS cascode bias diode (vbnc)
XMpsc  vbnc vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=0.5 nf=1 m=1
XMnd   vbnc vbnc 0   0   sky130_fd_pr__nfet_01v8_lvt W=1  L=0.5 nf=1 m=1

* ---------------- telescopic OTA ----------------
* 120 uA tail current source (6x mirror of iref)
XMtail tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* NMOS input pair
XM1    d1   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2    d2   inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS cascodes
XMc1   a    vbnc d1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMc2   out  vbnc d2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS load for the non-inverting branch (node a is the mirror control node)
XMp0   p1   a    vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMp1   a    vbp  p1  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS load for the output branch (mirror of the non-inverting branch)
XMp2   q    a    vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMp3   out  vbp  q   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
