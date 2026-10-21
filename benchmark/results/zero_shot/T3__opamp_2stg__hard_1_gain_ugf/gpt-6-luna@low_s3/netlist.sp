.subckt Bias iref vbias_n vbias_p
* The reference current enters the drain of the diode-connected NMOS.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS mirror branch establishes the PMOS bias.
XNB vbias_p iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPB vbias_p vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends Bias

.subckt Opamp vbias_n vbias_p inp inn out
* PMOS differential pair and NMOS current-mirror load.
XMP1 n1 inp ns vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 n2 inn ns vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMPT ns vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1
XMN1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage.
XMN3 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XMP3 out vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1

* Miller compensation.
CCOMP n2 out 2p
.ends Opamp

.subckt dut iref inp inn out
XB0 iref vbias_n vbias_p Bias
XA0 vbias_n vbias_p inp inn out Opamp
.ends dut
