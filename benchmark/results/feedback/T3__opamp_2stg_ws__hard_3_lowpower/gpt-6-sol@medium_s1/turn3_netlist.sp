.subckt dut iref inp inn out
* The reference current flows through a diode-connected NMOS stack.
* nb biases the current mirrors; iref biases the output cascode.
XREFLOW nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XREFHIGH iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Differential input stage and current-mirror load.
XTAIL tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPLOAD gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Second stage with a cascoded NMOS current sink.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.5 nf=1 m=1
XSINKLOW sink nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=2 nf=1 m=1
XSINKCAS out iref sink 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.5 nf=1 m=1

* Miller compensation with a series nulling resistor.
RCOMP gain comp 25k
CCOMP comp out 220f
.ends dut
