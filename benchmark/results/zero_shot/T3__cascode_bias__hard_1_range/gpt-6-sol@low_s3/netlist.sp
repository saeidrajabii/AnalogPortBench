.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows through the NMOS bias stack.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNREF1 iin vb3 nref_s nref_s sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RNREF nref_s vb4 3k
RNGATE iin vb3 1

* Mirror the reference current into a PMOS bias stack.
XNBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPREF0 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPREF1 vb2 vb2 pref_s vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
RPREF vb1 pref_s 3k

* Complementary cascode output branches.
XNSINK0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNSINK1 out vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPSRC0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPSRC1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
