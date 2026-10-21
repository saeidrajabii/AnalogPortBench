.subckt dut iref inp inn out

* Reference-current mirror and bias sinks
XMBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMOUTBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XMINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMPLREF n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1 nf=1 m=1
XMPL n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1 nf=1 m=1

* Common-source output stage
XMOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=0.5 nf=1 m=1

* Series-R Miller compensation
RCOMP n1 nc 2k
CCOMP nc out 0.55p

.ends dut
