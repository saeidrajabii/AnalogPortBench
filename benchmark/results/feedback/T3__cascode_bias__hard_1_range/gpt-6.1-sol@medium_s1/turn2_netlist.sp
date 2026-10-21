.global vdd

.subckt amp_low sense target gate bn bp
XPT tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=20
XP1 d1 sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XP2 d2 target tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XN1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200
XN2 d2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200
XN3 gate d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200
XP3 gate bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=20
CC d2 gate 10p
.ends amp_low

.subckt amp_high sense target gate bn bp
XNT tail bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
XN1 d1 sense tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XN2 d2 target tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=200
XP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=200
XP3 gate d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=200
XN3 gate bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
CC d2 gate 10p
.ends amp_high

.subckt dut iin out vb1 vb2 vb3 vb4

* Diode-connected reference: input current enters its drain.
XREF iin iin refsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200
RREF refsense 0 500

* Mirrored auxiliary bias.
XBN bp iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
XBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=20

* Reference-current replica establishes the PMOS sense voltage.
XAPR pref_ns refsense pref_ng iin bp amp_low
XNR pref_pg pref_ng pref_ns 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200
RNR pref_ns 0 500
XPR pref_pg pref_pg pref_ps vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=200
RPR vdd pref_ps 500

* Cascode internal-drain voltage targets.
RNT vdd ntarget 1.13Meg
RNB ntarget 0 70k
RPT vdd ptarget 70k
RPB ptarget 0 1.13Meg

* Regulated NMOS current sink.
XANI nsense refsense vb4 iin bp amp_low
XANC ndrain ntarget vb3 iin bp amp_low
RNS nsense 0 500
XNMAIN ndrain vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200
XNCAS out vb3 ndrain 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=200

* Regulated PMOS current source.
XAPI psense pref_ps vb1 iin bp amp_high
XAPC pdrain ptarget vb2 iin bp amp_high
RPS vdd psense 500
XPMAIN pdrain vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=200
XPCAS out vb2 pdrain vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=200

.ends dut
