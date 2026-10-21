.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current flows through the NMOS bias stack.
RIN iin vb3 1
XNBIAS1 vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNBIAS0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* A mirrored NMOS branch establishes the PMOS bias stack.
XNREF0 nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNREF1 vb2 vb3 nref nref sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPBIAS0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XPBIAS1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Matched cascode source and sink meet at out.
XNSINK0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNSINK1 out vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPSOURCE1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XPSOURCE0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
.ends dut
