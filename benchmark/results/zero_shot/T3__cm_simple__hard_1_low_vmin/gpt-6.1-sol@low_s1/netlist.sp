.subckt dut in out

* Reference branch and matched current-sense resistors.
XREF in in sref 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
RREF sref 0 1k

* Feedback-controlled output sink.
XOUT out drive sout 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
ROUT sout 0 1k

* PMOS bias generator.
XBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
RBIAS pbias 0 100k

* PMOS differential input stage.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=2
XPREF nerr sref tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XPSENSE nload sout tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* NMOS active load.
XNLOAD nload nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XNMIR nerr nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1

* Second gain stage and compensation.
XNGAIN drive nerr 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XPLOAD drive pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
CCOMP nerr drive 2p

.ends dut
