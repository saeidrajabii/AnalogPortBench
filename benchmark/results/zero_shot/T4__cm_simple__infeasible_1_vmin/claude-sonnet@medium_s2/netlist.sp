.subckt dut in out
* NMOS diode takes the reference current
XMN1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
* NMOS mirror sinks Iref from the PMOS diode
XMN2 pd in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
* PMOS diode
XMP1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=4 nf=1 m=1
* PMOS output device sources current into out
XMP2 out pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=4 nf=1 m=1
.ends dut
