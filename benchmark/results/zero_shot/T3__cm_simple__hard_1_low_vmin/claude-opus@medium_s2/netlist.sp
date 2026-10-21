.subckt dut in out
* Main mirror pair (matched Vds enforced by OTA)
XM1 in  g 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=10
XM2 out g 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=10

* Matched level-shift dividers (currents cancel in Iout)
R1a in  va 600k
R1b va  0  400k
R2a out vb 600k
R2b vb  0  400k

* OTA bias
XMB  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
RB   vbp 0 65k
XMT  s   vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS input pair: va (from in) -> non-inverting side, vb (from out) -> inverting side
XMPX d1 va s s sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPY g  vb s s sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* NMOS current-mirror load
XMNX d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNY g  d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
