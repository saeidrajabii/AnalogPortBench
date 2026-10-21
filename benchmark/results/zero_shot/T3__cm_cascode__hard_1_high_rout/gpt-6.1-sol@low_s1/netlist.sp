* Low-compliance, feedback-regulated current mirror.
* Candidate design; specifications require verification with the supplied models.

.subckt cm_error_amp vp vn vo pb
* Positive differential gain: vo increases when vp exceeds vn.
XTAIL ns pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=5 nf=1 m=1
XP1 nd vp ns vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=50 nf=1 m=1
XP2 vo vn ns vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=50 nf=1 m=1
XN1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=100 nf=1 m=1
XN2 vo nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=100 nf=1 m=1
.ends cm_error_amp

.subckt dut in out
* Nominal 60 mV drain-voltage target.
RVT vdd vtarget 19k
RVB vtarget 0 1k

* Shared amplifier bias.
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=5 nf=1 m=1
RBIAS pb 0 300k

* Reference feedback sets the common mirror gate voltage.
XAREF in vtarget ng pb cm_error_amp
XNREF in ng 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=2 nf=1 m=1

* Output feedback matches the two mirror drain voltages.
XAOUT nx in nc pb cm_error_amp
XNOUT nx ng 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=2 nf=1 m=1
XNCAS out nc nx 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=2 nf=1 m=1
.ends dut
