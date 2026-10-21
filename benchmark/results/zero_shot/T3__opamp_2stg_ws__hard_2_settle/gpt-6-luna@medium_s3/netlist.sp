.subckt Cascode_Bias_WS Iin Vbn
  XNREF Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vbn inp inn out
  * NMOS differential pair and PMOS current-mirror load
  XMN1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
  XMN2 net09 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
  XMNT tail Vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

  XMP1 net09 net09 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
  XMP2 net08 net09 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

  * PMOS second stage with mirrored NMOS bias current
  XMPREF p2ref p2ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
  XMNSREF p2ref Vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
  XMPOUT out p2ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
  XMNSOUT out Vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

  * Miller compensation with series nulling resistor
  RZ net08 ncomp 1k
  CC ncomp out 400f
.ends Opamp_2stg

.subckt dut iref inp inn out
  XBIAS iref vbn Cascode_Bias_WS
  XOTA vbn inp inn out Opamp_2stg
.ends dut
