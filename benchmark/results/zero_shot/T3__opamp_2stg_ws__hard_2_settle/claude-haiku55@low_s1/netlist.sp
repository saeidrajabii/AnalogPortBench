.subckt dut iref inp inn out
* NMOS bias diode: 20 uA from iref (ratio 1x)
XMBn iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail current source: 40 uA (2x)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Second-stage sink: 100 uA (5x)
XMN6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* First-stage input pair (inp drives out1 inverting path)
XM1 out1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load (M3 diode-connected)
XM3 d2 d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4 out1 d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Second stage: PMOS common source, 100 uA sink
XMP5 out out1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Miller compensation with nulling resistor
CC cn out 0.5p
RR cn out1 3k
.ends dut
