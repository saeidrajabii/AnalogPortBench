.subckt dut in out
* Convert the 20 uA reference current to a voltage.
RREF in 0 1k

* Bias the differential amplifier and its output stage.
XBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
RBP bp 0 100k
XTAIL tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* Compare the reference voltage with the output current's sense voltage.
XPREF amp in tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
XPSENSE load sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
XNLOAD load load 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1
XNMIR amp load 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1

* Amplify the correction and regulate the output sink current.
XPU gate bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XPD gate amp 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XOUT out gate sense 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=3 nf=1 m=1
RSENSE sense 0 1k
.ends dut
