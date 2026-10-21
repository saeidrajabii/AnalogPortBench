.subckt Cascode_Bias_SKY iref vbn vbnc vbp vbpc
* NMOS sink gate = iref (diode-connected reference, ~20 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* NMOS cascode gate: diode-connected device fed by a PMOS mirror
XMnc vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMncs vbnc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS mirror bias: diode PMOS sourced from vdd, sunk by NMOS mirror
XMpb vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMpbs vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS cascode gate: diode PMOS
XMpc vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMpcs vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends Cascode_Bias_SKY

.subckt OTA_Folded_Cascode_SKY vbn vbnc vbp vbpc inm out inp
* Input pair (NMOS), tail sunk to ground
XMt tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XM1 fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 out inm tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Left fold branch: PMOS source + cascode into fl, NMOS fold sink + cascode
XMPSl pl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMPCl fl vbpc pl vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMNFCl fl vbnc nfl 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNFSl nfl vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Right (output) branch: PMOS source + cascode into out, NMOS sink + cascode
XMPSr pr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMPCr out vbpc pr vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMNOCr out vbnc nor 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMNOSr nor vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* Fold mirror: left diode-connected PMOS feeding the output side
XMPM fl fl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
.ends OTA_Folded_Cascode_SKY

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_SKY
XI1 vb1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode_SKY
.ends dut
