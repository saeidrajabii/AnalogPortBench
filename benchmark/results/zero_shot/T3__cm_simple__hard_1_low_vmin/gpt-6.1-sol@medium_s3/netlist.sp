.subckt dut in out

* Reference branch and matched current-sense resistors.
XREF in in sr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
RREF sr 0 2k
ROUT so 0 2k

* Output current sink, controlled by source-voltage feedback.
XOUT out vg so 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1

* Reference-derived amplifier bias.
XBN pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* PMOS differential input stage.
XTAIL st pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPS nd so st vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1
XPR na sr st vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1

* NMOS current-mirror load.
XND nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=4 nf=1 m=1
XNA na nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=4 nf=1 m=1

* Inverting second stage and compensation.
XGN vg na 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XGP vg pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
CCOMP na vg 5p

.ends dut
