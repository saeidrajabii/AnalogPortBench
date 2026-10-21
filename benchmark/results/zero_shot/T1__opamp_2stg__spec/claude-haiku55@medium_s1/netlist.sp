.subckt dut iref inp inn out
* Reference diode (20 uA set by the ideal source into iref)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current source, 2x reference (40 uA)
XMtail nt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* NMOS differential pair (inn on diode-load side so inn->out is inverting)
XM1 nd1 inn nt 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 n1 inp nt 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS current-mirror load
XM3 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4 n1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second stage: PMOS common source with 80 uA NMOS sink (4x reference)
XM6 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=4
* Miller compensation with nulling resistor
RZ n1 nx 3k
CC nx out 0.4p
.ends dut
