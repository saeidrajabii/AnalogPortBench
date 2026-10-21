.subckt dut iref inp inn out
* Bias: iref is diode-connected NMOS (sets sink gate, ~20 uA reference)
XMR1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* NMOS cascode gate bias ~0.6 V (ideal resistive divider)
Rb1 vdd vb3 100k
Rb2 vb3 0 100k
* PMOS cascode gate bias ~0.55 V (ideal resistive divider)
Rb3 vdd vb2 60k
Rb4 vb2 0 50k

* Tail: NMOS cascode over mirrored sink (~80 uA)
XMTC tail vb3 ntc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMTS ntc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4

* Input pair (inn -> vm side, inp -> vp side)
XMN1 net016 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.3 nf=1 m=1
XMN2 net010 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.3 nf=1 m=1

* Folding NMOS cascodes and their sinks (~40 uA each)
XMN6 net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN7 net018 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
XMN9 out vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN8 net017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2

* PMOS mirror sources (gates on net1)
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1

* PMOS cascodes
XMP4 net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMP5 out vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
.ends dut
