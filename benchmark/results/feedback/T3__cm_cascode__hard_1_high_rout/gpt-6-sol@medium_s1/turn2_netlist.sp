.subckt dut in out
* Reference current develops a voltage across the reference sense resistor.
XREF in in ref_s 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=0.5 nf=1 m=1
RREF ref_s 0 4k

* Feedback adjusts the output gate until the output sense voltage matches it.
XOUT out drive out_s 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=0.5 nf=1 m=1
ROUT out_s 0 4k

* Bias for the differential amplifier and its gain stages.
XBN biasn in 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XBP biasn biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Differential input stage.
XPREF loadn ref_s tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPSENSE amp1 out_s tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XNLOAD loadn loadn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=5 nf=1 m=1
XNMIR amp1 loadn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=5 nf=1 m=1

* Two gain stages provide high DC loop gain.
XP2 amp2 biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XN2 amp2 amp1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=5 nf=1 m=1
XP3 drive biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XN3 drive amp2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=5 nf=1 m=1
.ends dut
