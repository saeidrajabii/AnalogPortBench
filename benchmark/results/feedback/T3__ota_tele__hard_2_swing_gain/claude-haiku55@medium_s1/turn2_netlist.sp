.subckt dut iref inp inn out
* Reference mirror and tail (W/L = 20, same as reference diode)
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* NMOS input pair (weak inversion, large W/L)
XM1   x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM2   x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1

* NMOS cascodes (gate vcn)
XMNC1 d1  vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNC2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS cascodes (gate vbpc)
XMPC1 d1  vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMPC2 out vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS folding current sources (gate vbp)
XMP1  fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2  fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS source bias: diode sets vbp, sunk by 10 uA NMOS
XMB5  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMB6  vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* PMOS cascode bias: diode sets vbpc, sunk by 10 uA NMOS
XMB7  vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB8  vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* NMOS cascode gate bias: resistive divider, vcn = 0.75 V
RVT   vdd vcn 300k
RVB   vcn 0 500k
.ends dut
