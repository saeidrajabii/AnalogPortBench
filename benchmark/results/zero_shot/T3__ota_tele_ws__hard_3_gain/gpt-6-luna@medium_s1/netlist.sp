.subckt OTA_Telescopic VCM VBN inp inn out
  * NMOS tail-current reference and 2:1 tail mirror
  XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
  XMNTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

  * Differential input pair and NMOS cascodes
  XMNINN ndn inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
  XMNINP ndp inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
  XMNCASN nref VBN ndn 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=4 nf=1 m=1
  XMNCASP out  VBN ndp 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=4 nf=1 m=1

  * PMOS current-mirror load
  XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1
  XMPLOAD out  nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1
.ends OTA_Telescopic

.subckt dut iref inp inn out
  * Cascode-gate bias
  RBN1 vdd vbn 100k
  RBN2 vbn 0 140k

  XIOTA 0 vbn inp inn out OTA_Telescopic
.ends dut
