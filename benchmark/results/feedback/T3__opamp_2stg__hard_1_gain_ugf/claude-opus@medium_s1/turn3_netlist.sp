.subckt Cascode_Bias Iin vbnc vb4 vbp vbpc
* reference branch: iref -> R1 -> diode MB1 ; vbnc = vb4 + 0.2 V
R1 Iin vb4 10k
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=5
* PMOS bias branch: vbpc = vbp - 12uA*18k
XMB3 vbpc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
R2 vbp vbpc 18k
XMPB1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
.ends Cascode_Bias

.subckt Opamp_fc vbnc vb4 vbp vbpc vm vout vp
* NMOS input pair and tail
XM1 fa vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 fb vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMT tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=9
* PMOS top current sources (fold nodes)
XMPA fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=6
XMPB fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=6
* PMOS cascodes
XMPCA o1 vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=3
XMPCB d vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=3
* NMOS low-voltage cascode mirror (diode side = d)
XMNCA o1 vbnc xa 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=4
XMNCB d vbnc xb 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=4
XMNA xa d 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMNB xb d 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
* second stage: NMOS common source with PMOS current-source load
XM6 vout o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=16
XMP6 vout vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=22
* Miller compensation with nulling resistor
RZ o1 ncc 2.2k
CC ncc vout 0.5p
.ends Opamp_fc

.subckt dut iref inp inn out
XI0 iref iref vb4 vbp vbpc Cascode_Bias
XI1 iref vb4 vbp vbpc inn out inp Opamp_fc
.ends dut
