* Folded-cascode OTA, SKY130 LVT, VDD = 1.2 V
* Changes from attempt 2: the tail is now at 60 uA headroom-limited... see notes; cascode and sink lengths raised
* to 1.5 um for output resistance, output-side PMOS sources moved to their own bias node so
* the mirror node carries little extra capacitance, and the reference diode is widened to lower Vdsat.

.subckt bias_wsk Iin Vbias_1 Vbias_2 Vbias_3
* Reference diode, 20 uA from Iin (W/L 74)
XMB Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=37 L=0.5 nf=1 m=1
* Vbias_1 (PMOS top-source gate, about 0.63 V): PMOS diode fed by a 40 uA sink
XMNs1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=74 L=0.5 nf=1 m=1
XMPd1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
* Vbias_2 (PMOS cascode gate, about 0.39 V): PMOS diode fed by a 15 uA sink
XMNs2 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=27.75 L=0.5 nf=1 m=1
XMPd2 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
* Vbias_3 (NMOS cascode gate, about 0.65 V): long-L NMOS diode fed by a 15 uA PMOS mirror
XMPm1 Vbias_3 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMNb Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=3.33 nf=1 m=1
.ends bias_wsk

.subckt ota_fcs Vbias_1 Vbias_2 Vbias_3 Vbias_4 vm vout vp
* NMOS tail, 80 uA
XMNt net08 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=148 L=0.5 nf=1 m=1
* Input pair, 40 uA each
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Fold branch: NMOS cascode and 40 uA sink
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=67.5 L=1.5 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=222 L=1.5 nf=1 m=1
* Output branch: NMOS cascode and 40 uA sink
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=67.5 L=1.5 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=222 L=1.5 nf=1 m=1
* PMOS cascodes
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=1.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=1.5 nf=1 m=1
* Fold-side top sources, mirrored from net1 (gate capacitance kept small)
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
* Output-side top sources, gated by the separate Vbias_1 node
XMP2 net016 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=1.5 nf=1 m=1
XMP3 net016 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=1.5 nf=1 m=1
.ends ota_fcs

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 bias_wsk
XI1 vb1 vb2 vb3 iref inn out inp ota_fcs
.ends dut
