.subckt Bias_LV iref vb3 vb4 vbp
* iref enters the drain of a stacked diode pair: vb3 = Vgs(MB3) + Vgs(MB1), vb4 = Vgs(MB1)
XMB3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* PMOS cascode bias: vbp = VDD - 20uA*10k - Vsg(diode matched to the load cascodes)
XMBS vbp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RB1 vdd s1 10k
XMPD vbp vbp s1 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.35 nf=1 m=1
.ends Bias_LV

.subckt Opamp_2stg_LV vb3 vb4 vbp vm vout vp
* tail (50 uA)
XMT tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
* NMOS input pair
XM1 n9 vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XM2 n8 vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* low-voltage cascoded PMOS mirror load
XMPA sa n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMPCA n9 vbp sa vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMPB sb n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMPCB n8 vbp sb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
* second stage: PMOS common source with cascoded NMOS sink (240 uA)
XM6 vout n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.4 nf=1 m=12
XM5 vout vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=12
XM4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=12
* Miller compensation with nulling resistor (LHP zero)
RZ n8 nc 2.5k
CC nc vout 0.6p
.ends Opamp_2stg_LV

.subckt dut iref inp inn out
XI0 iref vb3 vb4 vbp Bias_LV
XI1 vb3 vb4 vbp inn out inp Opamp_2stg_LV
.ends dut
