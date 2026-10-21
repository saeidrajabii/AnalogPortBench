.subckt dut iref inp inn out

* Reference-current mirror and tail-current bias.
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=4

* Approximately 5 uA PMOS bias reference.
XBN bp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* NMOS cascode bias: replica device with resistive source offset.
XBNC vcn bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XBND vcn vcn nb 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RBN nb 0 56k

* PMOS cascode bias: replica device with resistive source offset.
RBP vdd pb 32k
XBPD vcp vcp pb vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XBPC vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Differential input pair.
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.15 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.15 nf=1 m=1

* NMOS cascodes.
XNC1 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNC2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS cascodes and current-mirror load.
XPC1 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPC2 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPL1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XPL2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1

.ends dut
