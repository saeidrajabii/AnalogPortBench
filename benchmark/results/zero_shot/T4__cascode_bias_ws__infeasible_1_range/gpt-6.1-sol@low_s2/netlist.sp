.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current mirrors.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XNP pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1

* Mirrored reference currents establish the source-sense voltages.
XRN pref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
RPR vdd pref 1k
XRP nref pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
RNR nref 0 1k

* Cascode gate bias.
RBC1 vdd vb2 100k
RBC2 vb2 0 100k
RBC3 vb2 vb3 1

* NMOS current-sink feedback amplifier.
XNT ntail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XND1 nd nref ntail vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=20 nf=1 m=1
XND2 vb4 nsense ntail vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=20 nf=1 m=1
XNL1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=20 nf=1 m=1
XNL2 vb4 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=20 nf=1 m=1

* PMOS current-source feedback amplifier.
XPT ptail iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XPD1 pd pref ptail 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=20 nf=1 m=1
XPD2 vb1 psense ptail 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=20 nf=1 m=1
XPL1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=20 nf=1 m=1
XPL2 vb1 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=20 nf=1 m=1

* Source-sensed cascode output branches.
RNS nsense 0 1k
XN0 nsrc vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=1 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=1 nf=1 m=1

RPS vdd psense 1k
XP1 psrc vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=1 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=1 nf=1 m=1

.ends dut
