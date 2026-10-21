.subckt Cascode_Bias_SKY2 iref vb1 vb2 vb3
* Reference diode: iref is drain and gate of MN4, so the 20 uA is mirrored, not sourced into a transistor source.
XMN4   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* vb1: PMOS diode from vdd sunk by an NMOS mirror of iref (20 uA)
XMP1   vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMNs1  vb1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* vb2 (PMOS cascode gate ~0.85 V): PMOS current source (gate vb1) into NMOS diode
XMP2   vb2 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMNd2  vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.0 L=0.5 nf=1 m=1
* vb3 (NMOS cascode gate ~0.85 V): PMOS current source (gate vb1) into NMOS diode
XMP3   vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XMNd3  vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.0 L=0.5 nf=1 m=1
.ends Cascode_Bias_SKY2

.subckt OTA_FC_SKY2 vb2 vb3 vb4 vm vout vp
* NMOS input pair (30 uA each) and single NMOS tail (60 uA), unchanged for gm and bandwidth
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNt net08 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Folded sinks: cascode (gate vb3) on bottom (gate vb4), 20 uA each. W/L kept at 13.3 for the same current and Vdsat, L doubled for output resistance
XMN6 net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=1.0 nf=1 m=1
XMN7 net018 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=1.0 nf=1 m=1
XMN9 vout vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=1.0 nf=1 m=1
XMN8 net017 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.3 L=1.0 nf=1 m=1

* Top PMOS sources (gate net1), about 50 uA each side, W/L kept at 32
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.0 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.0 nf=1 m=1

* PMOS cascodes (gate vb2), 20 uA each, W/L kept at 24.4
XMP4 net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=24.4 L=1.0 nf=1 m=1
XMP5 vout vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=24.4 L=1.0 nf=1 m=1
.ends OTA_FC_SKY2

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 Cascode_Bias_SKY2
XI1 vb2 vb3 iref inn out inp OTA_FC_SKY2
.ends dut
