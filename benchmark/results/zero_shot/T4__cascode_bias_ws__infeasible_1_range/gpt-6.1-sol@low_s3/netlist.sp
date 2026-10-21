* Feedback-regulated cascode port.
* Candidate sizing: compliance and operating regions require verification
* with the testbench's SKY130 models; specifications are not certified.

.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current mirrors.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XNPR pdiode iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XPREF pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1

* Matched reference and output current-sense resistors.
XNVR pref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
RPR vdd pref 500
XPVR nref pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1
RNR nref 0 500
RNS nsense 0 500
RPS vdd psense 500

* Amplifier bias currents: nominally 5 uA per branch.
XNBT nb iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=1
XPBT nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=4 nf=1 m=1

* NMOS current-control amplifier: PMOS differential input,
* NMOS mirror load, and an inverting second stage.
XPNT ntail nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=4 nf=1 m=1
XPN1 nd nsense ntail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XPN2 ne nref ntail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XNN1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNN2 ne nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNN3 vb4 ne 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XPN3 vb4 nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=4 nf=1 m=1
CNN ne vb4 10p

* PMOS current-control amplifier: NMOS differential input,
* PMOS mirror load, and an inverting second stage.
XNPT ptail iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=1
XNP1 pd psense ptail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XNP2 pe pref ptail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XPP1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPP2 pe pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPP3 vb1 pe vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XNP3 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=1
CPP pe vb1 10p

* Cascode gate biases: vb3 = 0.45 V, vb2 = 0.75 V.
RB1 vdd vb2 150k
RB2 vb2 vb3 100k
RB3 vb3 0 150k
CB2 vb2 0 2p
CB3 vb3 0 2p

* Wide output devices provide low resistance during compliance limiting.
XN0 nsrc vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=1 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=1 nf=1 m=1
XP1 psrc vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=40000 L=1 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40000 L=1 nf=1 m=1

.ends dut
