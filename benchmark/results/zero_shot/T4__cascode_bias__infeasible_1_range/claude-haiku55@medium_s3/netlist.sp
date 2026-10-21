.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference: diode-connected at iin, 20 uA flows into iin from vdd
XMN_REF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* vb4 tracks the reference gate voltage (no DC current through 1G)
RB4 vb4 iin 1G
* PMOS diode: sources the reference current into vb1
XMP_REF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=57 L=1 nf=1 m=1
* NMOS sink copy at vb1: pulls the same 20 uA through the PMOS diode
XMN_B vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output NMOS current sink (drain = out)
XMN_OUT out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output PMOS current source (drain = out)
XMP_OUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=57 L=1 nf=1 m=1
* vb2 and vb3 are unloaded bias outputs; tied through 1G so they are not floating
RB2 vb2 vb1 1G
RB3 vb3 vb4 1G
.ends dut
