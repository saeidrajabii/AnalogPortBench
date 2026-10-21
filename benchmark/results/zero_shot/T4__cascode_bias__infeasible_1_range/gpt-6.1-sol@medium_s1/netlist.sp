.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current mirrors.
RIN iin vb4 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XNPMREF vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1

* Mirrored-current reference voltages for source-resistor regulation.
XPNREF nref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
RNREF nref 0 1k
XNPREF pref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
RPREF vdd pref 1k

* Level-shifted cascode biases.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
RNBIAS vb3 ndiod 8k
XNDIOD ndiod ndiod 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
RPBIAS pdiod vb2 8k
XPDIOD pdiod pdiod vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1 nf=1 m=1

* NMOS cascode sink with source-current sensing.
RNSENSE nsense 0 1k
XNSINK nsrc ngate nsense 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* PMOS cascode source with source-current sensing.
RPSENSE vdd psense 1k
XPSOURCE psrc pgate psense vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1 nf=1 m=1

* Matched common-mode shifts for the sink error amplifier.
RNRUP vdd nrinput 90Meg
RNRDN nrinput nref 30Meg
RNSUP vdd nsinput 90Meg
RNSDN nsinput nsense 30Meg

* Sink error amplifier: PMOS differential pair and NMOS mirror load.
XNTAILP ntail vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1
XNINREF nload nrinput ntail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=10 nf=1 m=1
XNINSENSE ngate nsinput ntail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=10 nf=1 m=1
XNLOADREF nload nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=10 nf=1 m=1
XNLOADOUT ngate nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=10 nf=1 m=1
CNGATE ngate 0 2p

* Matched common-mode shifts for the source error amplifier.
RPRUP pref prinput 30Meg
RPRDN prinput 0 90Meg
RPSUP psense psinput 30Meg
RPSDN psinput 0 90Meg

* Source error amplifier: NMOS differential pair and PMOS mirror load.
XPTAILN ptail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XPINREF pload prinput ptail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=1
XPINSENSE pgate psinput ptail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=1
XPLOADREF pload pload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=10 nf=1 m=1
XPLOADOUT pgate pload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=10 nf=1 m=1
CPGATE pgate vdd 2p

* Candidate design; numerical compliance requires the supplied TT models
* and the specified ngspice operating-point and DC-sweep tests.
.ends dut
