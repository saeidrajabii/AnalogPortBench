.subckt dut iin out vb1 vb2 vb3 vb4
* Mirror the reference current into the bias branches.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNPD vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNPC vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* PMOS mirror and cascode-bias generators.
XPD vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPBC vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
RPC vdd pcas_src 9k
XPCD vb2 vb2 pcas_src vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* NMOS cascode-bias generator.
RNC ncas_src 0 9k
XNCD vb3 vb3 ncas_src 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* Buffer the reference gate voltage onto the fourth bias output.
RVB4 iin vb4 1k

* Output cascode branches.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
.ends dut
