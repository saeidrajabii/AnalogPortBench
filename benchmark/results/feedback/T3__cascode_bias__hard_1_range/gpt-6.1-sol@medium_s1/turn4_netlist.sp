.global vdd

.subckt amp_low sense target gate bn bp
XPT tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=160
XP1 d1 sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=32
XP2 d2 target tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=32
XN1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=1600
XN2 d2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=1600
XN3 gate d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=1600
XP3 gate bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=160
CC d2 gate 10p
.ends amp_low

.subckt amp_high sense target gate bn bp
XNT tail bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=160
XN1 d1 sense tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=32
XN2 d2 target tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=32
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=1600
XP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=1600
XP3 gate d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=8 nf=1 m=1600
XN3 gate bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=8 nf=1 m=160
CC d2 gate 10p
.ends amp_high

.subckt dut iin out vb1 vb2 vb3 vb4

* The ideal reference current enters a diode-connected drain.
XREF iin iin refsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=800
RREF refsense 0 2k

* Mirrored auxiliary bias.
XBN bp iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=80
XBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=80

* Feedback reference replica with finite-gain compensation.
XAPR pref_ns refsense pref_ng iin bp amp_low
XNR pref_pg pref_ng pref_ns 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=800
RNR pref_ns 0 2015.8
XPR pref_pg pref_pg pref_ps vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=800
RPR vdd pref_ps 2k

* Internal-drain targets provide additional saturation margin.
RNT vdd ntarget 1.11Meg
RNB ntarget 0 90k
RPT vdd ptarget 90k
RPB ptarget 0 1.11Meg

* Regulated NMOS cascode current sink.
XANI nsense refsense vb4 iin bp amp_low
XANC ndrain ntarget vb3 iin bp amp_low
RNS nsense 0 2015.8
XNMAIN ndrain vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=800
XNCAS out vb3 ndrain 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=800

* Regulated PMOS cascode current source.
XAPI psense pref_ps vb1 iin bp amp_high
XAPC pdrain ptarget vb2 iin bp amp_high
RPS vdd psense 2016.87
XPMAIN pdrain vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=800
XPCAS out vb2 pdrain vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=800

.ends dut
