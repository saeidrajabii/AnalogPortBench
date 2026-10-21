.subckt bias_gen iref nref pbias
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2.5 nf=1 m=1
XMPBS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2.5 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=2.5 nf=1 m=1
.ends bias_gen

.subckt OTA_TwoStage inp inn out nref pbias
XMNTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2.5 nf=1 m=1

XMNI xd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2.5 nf=1 m=1
XMNP xd inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2.5 nf=1 m=1

XMPD xd xd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2.5 nf=1 m=1
XMPM x1 xd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2.5 nf=1 m=1

XMNS2 out x1 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=2.5 nf=1 m=1
XMPS2 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=37.5 L=2.5 nf=1 m=1
XMNB2 n2 nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=1

RZ x1 xcomp 4k
CC xcomp out 0.8p
.ends OTA_TwoStage

.subckt dut iref inp inn out
XBIAS iref iref pbias bias_gen
XAMP inp inn out iref pbias OTA_TwoStage
.ends dut
