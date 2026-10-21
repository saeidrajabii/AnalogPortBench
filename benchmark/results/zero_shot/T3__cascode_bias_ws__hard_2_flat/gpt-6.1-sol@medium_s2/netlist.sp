* Low-headroom cascoded mirrors.
* Candidate sizing; specification compliance requires TT ngspice verification.
* W and L are in micrometres.

.subckt dut iin out vb1 vb2 vb3 vb4

* Cascoded NMOS reference branch.
* The reference current enters a drain, not a source.
Rgate iin vb4 1m
XNREFC iin vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1
XNREFB nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1

* Cascoded PMOS reference branch, loaded by an NMOS mirror.
XPREFB pr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPREFC vb1 vb2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XNPLOADC vb1 vb3 npl 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1
XNPLOADB npl vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1

* NMOS cascode bias: reduced-width diode-connected transistor.
XPNBIASB pnb vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPNBIASC vb3 vb2 pnb vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XNBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1666.667 L=10 nf=1 m=1

* PMOS cascode bias: reduced-width diode-connected transistor.
XPBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3333.333 L=10 nf=1 m=1
XNPBIASC vb2 vb3 npb 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1
XNPBIASB npb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1

* Output NMOS cascode current sink.
XNOUTB nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1
XNOUTC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=10 nf=1 m=1

* Output PMOS cascode current source.
XPOUTB psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPOUTC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1

.ends dut
