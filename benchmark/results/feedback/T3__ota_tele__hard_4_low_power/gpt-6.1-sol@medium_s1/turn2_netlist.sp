.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference,
* 8 uA differential-pair tail, 17 uA output-stage bias.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=170 L=2 nf=1 m=1

* Differential first stage with current-mirror load.
XINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XINP ng inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XPD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPM ng nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Increased output-stage current and transconductance.
XOUT out ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=97.14 L=1 nf=1 m=1

* Series-R Miller compensation.
RZERO ng nc 12k
CCOMP nc out 0.85p

.ends dut
