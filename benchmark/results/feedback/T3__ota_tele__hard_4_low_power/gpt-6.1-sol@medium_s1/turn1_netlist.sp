.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 8 uA tail,
* and 14 uA second-stage bias.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=2 nf=1 m=1

* Differential first stage with PMOS current-mirror load.
* Input assignment gives non-inverting overall polarity.
XINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XINP ng inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XPD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPM ng nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Common-source output stage.
XOUT out ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* Series-R Miller compensation.
RZERO ng nc 6.8k
CCOMP nc out 0.85p

.ends dut
