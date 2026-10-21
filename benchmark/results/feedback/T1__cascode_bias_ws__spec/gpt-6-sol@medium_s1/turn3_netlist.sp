.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current mirror and PMOS bias
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XNB1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XNB2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XPB1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1

* PMOS cascode bias
RPC vdd pc_bias_src 12k
XPB2 vb2 vb2 pc_bias_src vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1

* NMOS cascode bias
XPB3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1
RNC nc_bias_src 0 12k
XNB3 vb3 vb3 nc_bias_src 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1

* Fourth bias output carries the reference mirror gate voltage
RVB4 iin vb4 1k

* Output current-source and current-sink branches
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=196 L=4 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=196 L=4 nf=1 m=1
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=84 L=4 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=84 L=4 nf=1 m=1
.ends dut
