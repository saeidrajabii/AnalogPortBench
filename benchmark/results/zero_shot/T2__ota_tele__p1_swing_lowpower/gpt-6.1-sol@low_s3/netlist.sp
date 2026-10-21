* Two-stage, Miller-compensated candidate.
* Performance requires verification with the supplied SKY130 models.
.subckt dut iref inp inn out

* Mirror the external 20 uA reference into a 10 uA bias branch.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Approximately 30 uA PMOS-input differential stage.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XINP n1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XINN nd inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XLOAD1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD2 n1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Approximately 50 uA common-source output stage.
XOUTN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RZ n1 nc 1k
CC nc out 1p

.ends dut
