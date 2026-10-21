.subckt dut iref inp inn out
* Tail and input pair (NMOS folded cascode input stage)
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XM1   x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XM2   x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1

* Reference diode (20 uA from ideal source into iref)
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* NMOS cascodes (gate vcn)
XMNC1 d1  vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNC2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS cascodes (gate vbpc)
XMPC1 d1  vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPC2 out vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS folding current sources (gate vbp)
XMP1  fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP2  fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS bias: diode generates vbp (10 uA, mirror ratio 0.5 from iref)
XMB5  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB6  vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* PMOS cascode bias: vbpc ~ vdd - Vsg (10 uA)
XMB7  vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB8  vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* NMOS cascode bias: vcn = Vgs(MB2) + Vgs(MB3), fed by 10 uA PMOS mirror
XMB4  vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB2  vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB3  nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
