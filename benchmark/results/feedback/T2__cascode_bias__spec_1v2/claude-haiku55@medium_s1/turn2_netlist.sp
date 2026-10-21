.subckt dut iin out vb1 vb2 vb3 vb4
* Reference: ideal 20 uA enters iin; NMOS diode MNr sinks it (gate = vb4)
XMNr iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
Rw1 iin vb4 1m
* NMOS mirror sinks 20 uA from the PMOS reference diode
XMNb vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
* PMOS diode reference (gate = drain = vb1)
XMPr vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=3 nf=1 m=1
* Output source (PMOS mirror from vdd) and sink (NMOS mirror to ground), trimmed
XMPo out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=77 L=3 nf=1 m=1
XMNo out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=29.5 L=3 nf=1 m=1
* Unloaded bias outputs vb2 and vb3 are copies of vb1 and vb4
Rb2 vb1 vb2 1m
Rb3 vb4 vb3 1m
.ends dut
