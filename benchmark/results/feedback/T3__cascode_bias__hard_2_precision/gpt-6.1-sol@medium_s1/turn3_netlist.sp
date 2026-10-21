.subckt amp_low vp vn vo bp
XTAIL ps bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=2
XIN1 nd vn ps vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20
XIN2 nx vp ps vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20
XLD1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20
XLD2 nx nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20
XGAIN vo nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=400
XLOAD vo bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=2
CC nx vo 10p
.ends amp_low

.subckt amp_high vp vn vo bn
XTAIL ns bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=2
XIN1 pd vn ns 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20
XIN2 px vp ns 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20
XLD1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20
XLD2 px pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20
XGAIN vo px vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=400
XLOAD vo bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=2
CC px vo 10p
.ends amp_high

.subckt dut iin out vb1 vb2 vb3 vb4

* Auxiliary amplifier bias currents.
XPBIAS bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=1
RPBIAS bp 0 500k
XNBIAS bn bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=1
RNBIAS vdd bn 500k

* Internal drain-voltage targets: 60 mV and 1.14 V.
RLTOP vdd vlo 190k
RLBOT vlo 0 10k
RHTOP vdd vhi 10k
RHBOT vhi 0 190k

* Reference current enters the drain of the reference NMOS.
XAREF iin vlo vb4 bp amp_low
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20000

* Regulated NMOS mirror supplies the PMOS reference branch.
XNF nfeed vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20000
XNCF pref gnref nfeed 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20000
XANF vlo nfeed gnref bp amp_low

* PMOS reference with regulated drain voltage.
XPREF pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20000
XAPREF pref vhi vb1 bn amp_high

* Regulated NMOS cascode output current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20000
XNCSINK out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=20000
XANSINK vlo nsrc vb3 bp amp_low

* Regulated PMOS cascode output current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20000
XPCSOURCE out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=8 nf=1 m=20000
XAPSOURCE vhi psrc vb2 bn amp_high

.ends dut
