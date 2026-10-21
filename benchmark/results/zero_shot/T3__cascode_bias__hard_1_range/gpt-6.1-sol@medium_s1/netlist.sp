* Feedback-regulated cascode current source and sink.
* All transistor dimensions are in micrometres.
* Current-sense resistors develop 10 mV at 20 uA.
* Cascode feedback holds the internal drain nodes at
* approximately 70 mV and 1.13 V.

.subckt amp_low sense target gate bn bp
* Inverting amplifier with a PMOS differential input pair.
XPT tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
XP1 d1 sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
XP2 d2 target tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
XN1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
XN2 d2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
XN3 gate d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
XP3 gate bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
CC d2 gate 10p
.ends amp_low

.subckt amp_high sense target gate bn bp
* Inverting amplifier with an NMOS differential input pair.
XNT tail bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XN1 d1 sense tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XN2 d2 target tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XP3 gate d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XN3 gate bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
CC d2 gate 10p
.ends amp_high

.subckt dut iin out vb1 vb2 vb3 vb4

* Reference current enters the drain of a diode-connected NMOS.
* Its source resistor establishes the reference sense voltage.
XREF iin iin refsense 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
RREF refsense 0 500

* Auxiliary amplifier bias.
XBN bp iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1

* Feedback mirror of the reference current into a PMOS reference.
XAPR pref_ns refsense pref_ng iin bp amp_low
XNR pref_pg pref_ng pref_ns 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
RNR pref_ns 0 500
XPR pref_pg pref_pg pref_ps vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
RPR vdd pref_ps 500

* Internal-drain targets for the regulated cascodes.
RNT vdd ntarget 1.13Meg
RNB ntarget 0 70k
RPT vdd ptarget 70k
RPB ptarget 0 1.13Meg

* NMOS current control and cascode control.
XANI nsense refsense vb4 iin bp amp_low
XANC ndrain ntarget vb3 iin bp amp_low
RNS nsense 0 500
XNMAIN ndrain vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
XNCAS out vb3 ndrain 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1

* PMOS current control and cascode control.
XAPI psense pref_ps vb1 iin bp amp_high
XAPC pdrain ptarget vb2 iin bp amp_high
RPS vdd psense 500
XPMAIN pdrain vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPCAS out vb2 pdrain vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1

.ends dut
