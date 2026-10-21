.subckt dut iref inp inn out
* Reference current is converted to an NMOS mirror bias.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.7 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.7 nf=1 m=1

* PMOS bias for the output stage.
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINL left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINR first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPL left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XPR first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XOUTN out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
RCOMP first comp 1.8k
CCOMP comp out 0.85p
.ends dut
