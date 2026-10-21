.subckt bias20 iref bn bp
  XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
  XNBIAS bp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
  XPREF bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
.ends bias20

.subckt OTA_Telescopic VCM bn bp vm vout vp
  XTAIL nt bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1

  XMN1 ndp vp nt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
  XMN2 ndm vm nt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

  XMP1 ndp ndp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
  XMP2 ndm ndp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

  XMN3 vout ndm 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
  XMP3 vout ndm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1

  R1 ndm VCM 100Meg
  R2 vout VCM 100Meg
  RZ ndm ncomp 1k
  CC ncomp vout 1p
.ends OTA_Telescopic

.subckt dut iref inp inn out
  XBIAS iref bn bp bias20
  RCM1 vdd vcmref 5Meg
  RCM2 vcmref 0 5Meg
  XOTA vcmref bn bp inn out inp OTA_Telescopic
.ends dut
