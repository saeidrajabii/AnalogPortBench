.subckt dut in out
* Reference diode and auxiliary current mirror.
XNREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=3 nf=1 m=1
XNAUX pbias in 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=3 nf=1 m=1

* Generate a separate cascode bias from a mirrored reference current.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=3 nf=1 m=1
XPBIAS cbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=3 nf=1 m=1
XNBIAS cbias cbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=14.4 L=3 nf=1 m=1

* Low-compliance cascode output current sink.
XNOUT nmid in 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=3 nf=1 m=1
XNCAS out cbias nmid 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=3 nf=1 m=1
.ends dut
