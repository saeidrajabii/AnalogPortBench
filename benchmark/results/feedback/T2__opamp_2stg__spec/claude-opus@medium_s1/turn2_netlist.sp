.subckt Bias iref vb4 vcn vbp vcp
* iref enters resistor RN (not a transistor source); vcn = vb4 + 20uA*12k
RN   iref vb4 12k
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* the iref node is the cascode gate bias vcn
RS   iref vcn 1
* PMOS bias branch, 10 uA: vbp from the diode, vcp = vbp - 10uA*30k
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
RP   vbp vcp 30k
XMB2 vcp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends Bias

.subckt Opamp_FC vb4 vcn vbp vcp vm vout vp
* tail, 40 uA
XMT  ntail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
* input pair: vp drains to the right fold node (signal side), vm to the left
XMN1 fr vp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 fl vm ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS fold current sources, 35 uA each
XMS1 fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=2 nf=1 m=1
XMS2 fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=2 nf=1 m=1
* PMOS cascodes, 15 uA each
XMC1 nx  vcp fl vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XMC2 vo1 vcp fr vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
* wide-swing NMOS cascode mirror load
XMK1 nx  vcn nl 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XMK2 vo1 vcn nr 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XMB3 nl nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1.5 nf=1 m=1
XMB4 nr nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1.5 nf=1 m=1
* second stage: PMOS common source, cascoded NMOS sink (130 uA)
XMP2 vout vo1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=8
XMN5 vout vcn n1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=7
XMN4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=13
* Miller compensation with a nulling resistor
RZ vo1 nz 2k
CC nz vout 0.45p
.ends Opamp_FC

.subckt dut iref inp inn out
XB iref vb4 vcn vbp vcp Bias
XA vb4 vcn vbp vcp inn out inp Opamp_FC
.ends dut
