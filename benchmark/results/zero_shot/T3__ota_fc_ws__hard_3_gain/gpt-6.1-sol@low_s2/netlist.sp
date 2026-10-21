* Two-stage, Miller-compensated OTA.
* Candidate port; performance requires verification with the supplied
* SKY130 models and testbench.

.subckt dut iref inp inn out

* Reference-current sensing and mirrored bias branches.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* NMOS differential input stage with PMOS mirror load.
* The first-stage output is inverted relative to inp.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1

* Inverting second stage; nominal mirrored pull-up current is 60 uA.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1

* Miller compensation with series zero-control resistor.
RZERO stage1 comp 750
CCOMP comp out 2p

.ends dut
