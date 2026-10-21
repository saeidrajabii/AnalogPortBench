* Two-stage, Miller-compensated OTA.
* All transistor dimensions are in micrometres.
* Performance must be verified with the supplied SKY130 model library.

.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Approximately 60 uA input-stage tail current.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* PMOS differential pair and NMOS current-mirror load.
* The first-stage node falls when inp rises.
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Inverting output stage with approximately 100 uA bias.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RCOMP stage1 comp 500
CCOMP comp out 0.55p

.ends dut
