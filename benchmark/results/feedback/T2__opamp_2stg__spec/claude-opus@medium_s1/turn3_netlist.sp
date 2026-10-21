.subckt Bias iref vb4 vcn vbp vcp
* iref enters resistor RN (not a transistor source); vcn = vb4 + 20uA*12k
RS   iref vcn 1
RN   vcn vb4 12k
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS bias branch, 10 uA, low current density: vbp from the diode, vcp = vbp - 10uA*40k
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
RP   vbp vcp 40k
XMB2 vcp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends Bias

.subckt Opamp_FC vb4 vcn vbp vcp vm vout vp
* tail, 40 uA
XMT  ntail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
* input pair: vp to the right fold node (signal side), vm to the left
XMN1 fr vp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XMN2 fl vm ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
* PMOS fold current sources, 30 uA each
XMS1 fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=4
XMS2 fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=4
* PMOS cascodes, 10 uA each
XMC1 nx  vcp fl vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMC2 vo1 vcp fr vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* wide-swing NMOS cascode mirror load, 10 uA each
XMK1 nx  vcn nl 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMK2 vo1 vcn nr 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB3 nl nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XMB4 nr nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
* second stage: NMOS common source, wide PMOS current-source load (140 uA)
XMN6 vout vo1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMP6 vout vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=14
* Miller compensation with a nulling resistor
RZ vo1 nz 2.5k
CC nz vout 0.5p
.ends Opamp_FC

.subckt dut iref inp inn out
XB iref vb4 vcn vbp vcp Bias
XA vb4 vcn vbp vcp inn out inp Opamp_FC
.ends dut
