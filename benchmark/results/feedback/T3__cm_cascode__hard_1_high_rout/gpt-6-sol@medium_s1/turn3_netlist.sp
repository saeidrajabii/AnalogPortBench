.subckt dut in out
XREF in in ref_s 0 sky130_fd_pr__nfet_01v8_lvt W=500 L=0.5 nf=1 m=4
RREF ref_s 0 4k
XOUT out drive out_s 0 sky130_fd_pr__nfet_01v8_lvt W=500 L=0.5 nf=1 m=4
ROUT out_s 0 4k

RBIAS vdd biasn 100k
XBIAS biasn biasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XTAIL tail biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

XPREF loadn ref_s tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPSENSE amp1 out_s tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XNLOAD loadn loadn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=5 nf=1 m=1
XNMIR amp1 loadn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=5 nf=1 m=1

XP2 amp2 biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XN2 amp2 amp1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=5 nf=1 m=1
XP3 drive biasn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XN3 drive amp2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=5 nf=1 m=1
.ends dut
