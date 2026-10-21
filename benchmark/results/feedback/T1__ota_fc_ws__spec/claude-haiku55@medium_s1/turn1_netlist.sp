.subckt Cascode_Bias_SKY iref vb1 vb2 vb3 vb4
* Reference: iref is the drain/gate of a diode NMOS, so the 20 uA is mirrored, not sunk at a source.
XMN4  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN6  net1 iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN7  net2 iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN12 vb2  vb2  net1 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN11 vb1  vb1  net2 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN8  vb3  vb3  0    0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=2.0 nf=1 m=1
XMN10 net10 vb4 0    0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN9  vb4  vb3  net10 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

XMP4  vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=1.0 nf=1 m=1
XMP2  vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP3  net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP6  vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP7  net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
.ends Cascode_Bias_SKY

.subckt OTA_Folded_Cascode_SKY vb2 vb3 vb4 vm vout vp
* NMOS input pair and tail (tail doubled vs. bias leg for gm)
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN0 net08 vb3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=0.5 nf=1 m=1
XMN5 net08 vb3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=0.5 nf=1 m=1
XMN3 net020 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=0.5 nf=1 m=1
XMN4 net019 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=0.5 nf=1 m=1

* NMOS folding cascode sinks and output sink
XMN6 net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN7 net018 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN9 vout vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN8 net017 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

* PMOS folded sources (paired legs sized as one wide device) and cascodes
XMP4 net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP5 vout vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.4 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.4 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode_SKY

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_SKY
XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode_SKY
.ends dut
