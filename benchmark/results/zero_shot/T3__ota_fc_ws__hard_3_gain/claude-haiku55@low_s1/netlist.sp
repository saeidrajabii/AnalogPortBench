.subckt dut iref inp inn out
* ---------------- Bias network (mirrors the 20 uA reference) ----------------
* Reference diode: iref is driven from vdd by the ideal 20 uA source
XMN4  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* NMOS mirror copies that feed the cascode stacks
XMN6  net1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN7  net2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Diode-connected cascode devices generating vb1 and vb2
XMN12 vb2 vb2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN11 vb1 vb1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vb3: NMOS cascode gate (diode, longer L for a larger Vgs)
XMN8  vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
* vb4: OTA tail gate, self-biased through MN9/MN10
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN9  vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS bias copies (sourced from vdd)
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP7  net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP6  vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP4  vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP3  net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP2  vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---------------- Folded-cascode OTA ----------------
* NMOS input pair: vm = inn (gate of MN1), vp = inp (gate of MN2)
XMN1  net016 inn net08 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN2  net010 inp net08 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Tail cascode and tail
XMN5  net08 vb3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN4T net019 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Folding NMOS cascodes and sinks (left and right)
XMN6O net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN7O net018 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN9O out vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN8O net017 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS folded cascodes (vdd side)
XMP4O net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP5  out vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1  net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0  net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP3O net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2O net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
