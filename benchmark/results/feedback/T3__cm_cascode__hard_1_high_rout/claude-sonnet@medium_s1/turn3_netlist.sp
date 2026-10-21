.subckt dut in out
* pmos bias
XMpb pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
Rpb pb 0 2.5Meg
* input branch (replica)
XM1i di1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XM2i in gi di1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMai gi di1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMpi gi pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
* output branch
XM1o do1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XM2o out go do1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMao go do1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMpo go pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
.ends dut
