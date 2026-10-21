.subckt dut iref inp inn out
* ---- reference mirror (iref = 20 uA into diode MB1, 10 uA per unit device)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* tail current source, about 100 uA (5 uA of it is the vcn replica branch)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=10
* 2.5 uA sink for the PMOS cascode bias
XMB8 vcp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* ---- PMOS cascode bias: replica of M5 at equal current density, y about 1.03 V
RP   vdd yr 68k
XMB7 vcp vcp yr vdd sky130_fd_pr__pfet_01v8_lvt W=2.1 L=0.35 nf=1 m=1

* ---- NMOS cascode bias: replica of M3 stacked on the tail node (tracks input Vgs)
* x1/x2 sit about 0.13 V above the tail node
RA   vdd vcn 94k
XMB2 vcn vcn xr 0 sky130_fd_pr__nfet_01v8_lvt W=1.9 L=0.25 nf=1 m=1
RN   xr tail 26k

* ---- telescopic cascode core
XM1 x1  inp tail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.25 nf=1 m=4
XM2 x2  inn tail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.25 nf=1 m=4
XM3 d1  vcn x1   0   sky130_fd_pr__nfet_01v8_lvt W=9  L=0.25 nf=1 m=2
XM4 out vcn x2   0   sky130_fd_pr__nfet_01v8_lvt W=9  L=0.25 nf=1 m=2
XM5 d1  vcp y1   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=4
XM6 out vcp y2   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=4
XM7 y1  d1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=4
XM8 y2  d1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=4
.ends dut
