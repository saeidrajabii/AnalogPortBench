.subckt ota inp inn o vb
XMT tail vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMA a inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB o inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMC a a 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMD o a 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends ota

.subckt dut in out
* bias for the OTA tail current sources (~5 uA)
XMPB vb vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
RB vb 0 140k
* drain reference voltage, about 60 mV
R1 vdd vref 190k
R2 vref 0 10k
* input device: OTA1 drives its gate so that node in sits at vref
XM1 in g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=4
XA1 in vref g vb ota
C1 g 0 2p
* output mirror device with the same gate voltage and the same drain voltage
XM0 x g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=4
* regulated (gain-boosted) cascode: OTA2 holds node x at vref
XMC out gc x 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.15 nf=1 m=4
XA2 vref x gc vb ota
C2 gc 0 2p
.ends dut
