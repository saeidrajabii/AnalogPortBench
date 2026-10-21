.subckt dut iref inp inn out
* Reference mirror: 20 uA reference, 40 uA tail, 60 uA output bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2
XBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=3

* Differential input stage and PMOS current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XPD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XPM n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1

* Common-source output stage.
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=0.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP n1 nc 1.8k
CCOMP nc out 0.35p
.ends dut
