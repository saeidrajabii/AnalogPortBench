.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference sinks the 20 uA from iref
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS mirror branch sinks 20 uA from the PMOS diode node pb
XMNb pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS diode at pb and PMOS tail mirror (about 20 uA)
XMPd pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMPt tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS input pair (needed because VCM = 0.5 V leaves no headroom for an NMOS pair at 1.2 V)
XMP1 d1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* NMOS current-mirror load; inp is on the diode side, so the path is non-inverting
XMN3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMN4 out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
.ends dut
