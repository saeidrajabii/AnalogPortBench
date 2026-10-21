.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Reference-current mirror.
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMN6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1

* PMOS mirror-gate and cascode-bias generation.
XMN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=3 nf=1 m=1

* NMOS cascode-bias generation.
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=3 nf=1 m=1

* Replicated NMOS stack generates the current-sink bias.
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
* NMOS input pair and mirrored tail current.
* An uncascoded tail preserves input common-mode headroom.
XMN2 fold_p vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XMN1 fold_m vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XMTAIL tail Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=2

* Folded-branch current sinks and NMOS cascodes.
XMN7 sink_l Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMN8 sink_r Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMN6 mirror_gate Vbias_3 sink_l 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMN9 vout Vbias_3 sink_r 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1

* PMOS folding cascodes.
XMP4 mirror_gate Vbias_2 fold_p vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMP5 vout Vbias_2 fold_m vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1

* Matched PMOS mirror; each branch carries twice the bias current.
XMP0 fold_p mirror_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=2
XMP2 fold_m mirror_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=2
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
