.subckt dut iref inp inn out
* ---- bias: iref -> stacked diodes (vb3 = cascode gate, vb4 = mirror gate)
XMB3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* ---- first stage: NMOS diff pair, PMOS mirror load, 40uA tail
XMT  tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XM1  n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM2  n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP0 n1 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* ---- second stage: PMOS CS, cascoded NMOS sink (120uA)
XMP2 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=6
XMN5 out iref nc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
XMN4 nc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
* ---- compensation
RZ n1 nz 1.5k
CC nz out 0.6p
.ends dut
