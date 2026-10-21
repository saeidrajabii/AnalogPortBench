.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, approximately 60 uA tail.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Generate a cascode bias using a mirrored, stacked NMOS branch.
* The reference current is applied to a drain, not a transistor source.
XNB0 nb0 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.8 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=1
XNSINK pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.8 nf=1 m=1
XPBIAS vbcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=1
XNCASREF vbcas vbcas nb0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.2 nf=1 m=1

* Telescopic differential input pair.
XNINP ndp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=1.6 nf=1 m=1
XNINN ndn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=1.6 nf=1 m=1
XNCASP nleft vbcas ndp 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XNCASN out vbcas ndn 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* Matched cascoded PMOS mirror load; the left branch sets its own
* mirror voltage, while the right branch drives the output.
XPTOPL psl nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1.8 nf=1 m=1
XPTOPR psr nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1.8 nf=1 m=1
XPCASL nleft vbcas psl vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XPCASR out vbcas psr vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
.ends dut
