.subckt dut iref inp inn out
* Bias: NMOS diode at iref sinks the 20 uA reference (not a transistor source)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Half-size NMOS mirror: sinks 10 uA into the PMOS diode node vbp
XMB2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS diode from vdd, carries 10 uA
XMB3 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS tail, 2x the diode, carries 20 uA
XMT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* PMOS input pair (inp on the diode-side branch, inn on the output side)
XMI1 d1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMI2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS current-mirror load (diode on the inp side)
XML1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XML2 out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
