* Best-effort SKY130 port. Performance requires verification against the
* supplied SKY130 models and the specified testbench.

.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Convert the reference current into a diode-connected NMOS reference.
XMREF Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS current mirrors for the bias branches.
XMN1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN2 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN3 Vbias_3 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN4 Vbias_4 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Establish PMOS bias nodes from mirrored current branches.
XMP1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP2 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP3 Vbias_3 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP4 Vbias_4 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
* PMOS input pair and NMOS mirror load.
XMPINP netp vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPINM netn vm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNLOAD1 netp netp 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNLOAD2 netn netp 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Cascode devices and output branch.
XMNCASP out Vbias_4 netn 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNCAS netn Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPCASP out Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
