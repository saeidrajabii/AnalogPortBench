.subckt bias_gen iref vbn vbp_c
* NMOS wide-swing bias: iref -> R1 -> diode-like cascode stack
* iref node = NMOS cascode gate, vbn = NMOS current-source gate
R1 iref vbn 12.5k
XMN1 vbn iref z1 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=2
XMN2 z1 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=2
* Mirrored 20uA sink feeding the PMOS wide-swing stack -> vbp_c
XMN3 vbp_c iref z2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=2
XMN4 z2 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=2
R2 ypb vbp_c 15k
XMP1 ypb vbp_c zp vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=2
XMP2 zp ypb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=2
.ends bias_gen

.subckt ota_fc vbn vbn_c vbp_c vm vout vp
* tail (80uA)
XMT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=8
* NMOS input pair
XM1 n10 vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XM2 n16 vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
* PMOS current sources, self-biased from net1 (~70uA each)
XMPL n10 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=7
XMPR n16 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=7
* PMOS cascodes (30uA each)
XMCL net1 vbp_c n10 vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=3
XMCR vout vbp_c n16 vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=3
* NMOS cascoded sinks (30uA each)
XMNCL net1 vbn_c s1 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=3
XMNSL s1 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=3
XMNCR vout vbn_c s2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=3
XMNSR s2 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=3
.ends ota_fc

.subckt dut iref inp inn out
XB iref vbn vbp_c bias_gen
XO vbn iref vbp_c inn out inp ota_fc
.ends dut
