.subckt dut iref inp inn out
* The 20 uA reference flows through diode-connected NMOS devices.
* Their gate voltages bias cascoded current sinks.
XBN0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XBN1 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XT0 tail_low vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XT1 tail iref tail_low 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPL mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPR first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XPO out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.5 nf=1 m=1
XO0 out_low vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XO1 out iref out_low 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3

* Miller compensation with a series nulling resistor.
RC first comp 3k
CC comp out 500f
.ends dut
