.subckt Bias_Gen Iin vbn vbp vcp vcn
* reference stack: iref -> MB2 (diode, vcas = Iin) -> MB1 (diode, vbn)
XMB2 Iin Iin vbn 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* vbp: 5 uA into PMOS diode (unit 4/1)
XMNB1 vbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* vcp: 5 uA into weak PMOS diode (Vsg ~0.85 V)
XMNB2 vcp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
XMPCB vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.84 L=0.8 nf=1 m=1
* vcn: 5 uA into weak NMOS diode (Vgs ~0.85 V)
XMPB2 vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNCB vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2 nf=1 m=1
.ends Bias_Gen

.subckt Opamp_FC vbn vcas vbp vcp vcn vm vout vp
* Miller compensation with nulling resistor
CC0 net012 vout 0.6p
RR0 net08 net012 2k
* second stage: PMOS CS, cascoded NMOS sink (180 uA)
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=4
XMN5 vout vcas net1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=9
XMN4 net1 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=9
* first stage: NMOS-input folded cascode
XMN3 tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=2
XMN1 fa vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMN2 fb vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMPS1 fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=9
XMPS2 fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=9
XMPC1 net08 vcp fa vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPC2 x vcp fb vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* wide-swing cascoded NMOS mirror (input side x)
XMNC1 x vcn y1 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMNM1 y1 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMNC2 net08 vcn y2 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMNM2 y2 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
.ends Opamp_FC

.subckt dut iref inp inn out
XI0 iref vbn vbp vcp vcn Bias_Gen
XI1 vbn iref vbp vcp vcn inn out inp Opamp_FC
.ends dut
