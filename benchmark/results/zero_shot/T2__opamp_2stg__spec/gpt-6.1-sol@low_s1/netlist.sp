* Candidate port; performance must be verified with the supplied
* SKY130 models and testbench before specification compliance is claimed.

.subckt Cascode_Bias iref vbcas vbn
XMNREF0 vbmid vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNREF1 iref iref vbmid 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RBCAS iref vbcas 1
RBN vbmid vbn 1
.ends Cascode_Bias

.subckt Opamp_2stg vbcas vbn inn out inp
* NMOS differential input pair and PMOS mirror load.
XMNINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMNINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMNTail tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMPREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XMPLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1

* Common-source second stage with a cascoded mirrored current sink.
XMPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1.2 nf=1 m=1
XMNSINK sinkmid vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=7
XMNCAS out vbcas sinkmid 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=7

* Series-R Miller compensation.
RCOMP stage1 comp 1.5k
CCOMP comp out 550f
.ends Opamp_2stg

.subckt dut iref inp inn out
XBIAS iref vbcas vbn Cascode_Bias
XAMP vbcas vbn inn out inp Opamp_2stg
.ends dut
