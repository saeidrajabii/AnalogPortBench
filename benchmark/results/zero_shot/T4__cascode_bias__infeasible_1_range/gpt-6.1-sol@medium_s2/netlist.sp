.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current mirrors.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XNP pb iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XPR pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=20 nf=1 m=1

* Mirrored reference currents establish the current-sense voltages.
XRN rn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=20 nf=1 m=1
RRN rn 0 1k
XRP rp iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
RRP vdd rp 1k

* NMOS cascode bias, including source and bulk bias matching.
XNB vb3 pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=20 nf=1 m=1
XNCB vb3 vb3 ncb 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=2 nf=1 m=1
RNCB ncb 0 6k

* PMOS cascode bias, including source and bulk bias matching.
XPB vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XPCB vb2 vb2 pcb vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=2 nf=1 m=1
RPCB vdd pcb 6k

* NMOS current regulator: compare source-sense voltage against rn.
XNT nt pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=20 nf=1 m=1
XND1 na rn nt vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=20 nf=1 m=1
XND2 vb4 ns nt vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=20 nf=1 m=1
XNL1 na na 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1
XNL2 vb4 na 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1

* PMOS current regulator: compare source-sense voltage against rp.
XPT pt iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XPD1 pa rp pt 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=20 nf=1 m=1
XPD2 vb1 ps pt 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=20 nf=1 m=1
XPL1 pa pa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=20 nf=1 m=1
XPL2 vb1 pa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=20 nf=1 m=1

* Cascoded output current sink.
RNS ns 0 1k
XN0 nsrc vb4 ns 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=2 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=2 nf=1 m=1

* Cascoded output current source.
RPS vdd ps 1k
XP1 psrc vb1 ps vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=2 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=2 nf=1 m=1

.ends dut
