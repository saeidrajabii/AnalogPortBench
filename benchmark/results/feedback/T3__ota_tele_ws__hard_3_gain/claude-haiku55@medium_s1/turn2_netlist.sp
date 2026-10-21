.subckt dut iref inp inn out
* ---------------- bias generation ----------------
* 20 uA reference (diode-connected at iref)
XMref  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* 20 uA sink that loads the PMOS diode (gives vbp)
XMsnk  vbp  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMpd   vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=1   nf=1 m=1
* 20 uA PMOS source feeding the NMOS cascode bias diode (vbnc)
XMpsc  vbnc vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4  L=1   nf=1 m=1
XMnd   vbnc vbnc 0   0   sky130_fd_pr__nfet_01v8_lvt W=4  L=1   nf=1 m=1

* ---------------- telescopic OTA ----------------
* 60 uA tail (3x iref), low Vdsat
XMtail tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
* NMOS input pair, 30 uA per side
XM1    d1   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=130 L=0.5 nf=1 m=1
XM2    d2   inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=130 L=0.5 nf=1 m=1
* NMOS cascodes (long channel for output resistance)
XMc1   a    vbnc d1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1   nf=1 m=1
XMc2   out  vbnc d2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1   nf=1 m=1
* PMOS mirror load: non-inverting branch and output branch
XMp0   p1   a    vdd vdd sky130_fd_pr__pfet_01v8_lvt W=33 L=1 nf=1 m=1
XMp1   a    vbp  p1  vdd sky130_fd_pr__pfet_01v8_lvt W=33 L=1 nf=1 m=1
XMp2   q    a    vdd vdd sky130_fd_pr__pfet_01v8_lvt W=33 L=1 nf=1 m=1
XMp3   out  vbp  q   vdd sky130_fd_pr__pfet_01v8_lvt W=33 L=1 nf=1 m=1
.ends dut
