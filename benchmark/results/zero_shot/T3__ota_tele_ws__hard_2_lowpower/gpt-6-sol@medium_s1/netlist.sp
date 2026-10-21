.subckt dut iref inp inn out
* Reference current is diode-connected and mirrored; it does not enter a source terminal.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1

* NMOS differential pair and mirrored tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13 L=0.8 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1

* PMOS current-mirror load.
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XLOADOUT first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Second gain stage and Miller compensation with a series nulling resistor.
XGAIN out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=97 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=0.8 nf=1 m=1
RNULL first comp 4k
CCOMP comp out 1.65p
.ends dut
