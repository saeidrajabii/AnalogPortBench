.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS: the ideal input current sets the NMOS mirror gate voltage.
XMREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1

* PMOS cascode-bias stack and its NMOS mirror sinks.
XMPB_TOP vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPB_BOT vb1 vb1 vb2 vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPS_TOP vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XMPS_BOT vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1

* NMOS cascode-bias stack, supplied by a PMOS mirror.
XMPN_BIAS vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMNB_UP vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XMNB_DN vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XMPN_DN vb4 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1

* Cascode NMOS current sink.
XMNS_DN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XMNS_UP out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1

* Cascode PMOS current source.
XMPS_UP psrc vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPS_DN out vb1 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
.ends dut
