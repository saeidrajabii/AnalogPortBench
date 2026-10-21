.subckt dut iref inp inn out
* ---- bias: iref -> NMOS diode with series R (gives NMOS cascode gate at iref node)
RB1 iref nbn 10k
XMNB nbn nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* ---- PMOS bias branch (10 uA): diode + resistor makes PMOS cascode gate vcp
XMPD pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
RB2 pb vcp 35k
XMNM vcp nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---- PMOS tail (20 uA)
XMPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=2
* ---- PMOS input pair + cascodes
XMP1 a1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP2 a2 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP3 d1 vcp a1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP4 out vcp a2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---- NMOS low-voltage cascode mirror load
XMN3 d1 iref s1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN4 out iref s2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN1 s1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN2 s2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
