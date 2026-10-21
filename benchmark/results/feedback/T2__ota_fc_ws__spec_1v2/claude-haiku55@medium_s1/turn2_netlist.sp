* Folded-cascode OTA, SKY130 LVT, VDD = 1.2 V
* Changes from attempt 1: tail cascodes removed for headroom, bias voltages set
* by diode-referenced stacks, and bias currents raised to 40 uA for slew rate.

.subckt bias_wsk Iin Vbias_2 Vbias_3
* Reference diode, 20 uA from Iin
XMB Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=18.5 L=0.5 nf=1 m=1
* Vbias_2 (PMOS cascode gate, about 0.39 V): PMOS diode fed by a 15 uA sink
XMNs2 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.875 L=0.5 nf=1 m=1
XMPd2 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
* Vbias_3 (NMOS cascode gate, about 0.65 V): long-L NMOS diode fed by a 15 uA PMOS mirror
XMPm1 Vbias_3 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMNb Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=3.33 nf=1 m=1
.ends bias_wsk

.subckt ota_fcs Vbias_2 Vbias_3 Vbias_4 vm vout vp
* NMOS tail, 80 uA, no cascode
XMNt net08 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=74 L=0.5 nf=1 m=1
* Input pair, 40 uA each
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Fold branch: NMOS cascode and 40 uA sink
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1.0 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=37 L=0.5 nf=1 m=1
* Output branch: NMOS cascode and 40 uA sink
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1.0 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=37 L=0.5 nf=1 m=1
* PMOS cascodes
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
* PMOS top sources, mirrored from net1 (two copies per side)
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
.ends ota_fcs

.subckt dut iref inp inn out
XI0 iref vb2 vb3 bias_wsk
XI1 vb2 vb3 iref inn out inp ota_fcs
.ends dut
