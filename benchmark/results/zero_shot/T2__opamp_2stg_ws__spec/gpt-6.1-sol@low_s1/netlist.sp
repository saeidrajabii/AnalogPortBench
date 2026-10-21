* SKY130 1.2 V candidate port.
* Performance requires verification with the supplied models and testbench.

.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Generate a mirrored PMOS bias.
XBN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Replica stack establishes the output-sink cascode bias.
XBC cb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XCU cb cb cr 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XCL cr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* NMOS differential input stage, nominal 100 uA tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=5
XINP stage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* Long-channel PMOS mirror load.
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.5 nf=1 m=1
XLOAD2 stage mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.5 nf=1 m=1

* Common-source second stage with a cascoded mirrored current sink.
XOUTP out stage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1 nf=1 m=1
XOUTC out cb sink 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=9
XOUTN sink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=9

* Miller compensation with a series zero-control resistor.
RZERO stage comp 450
CCOMP comp out 1.5p

.ends dut
