.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2

* NMOS differential input stage with PMOS mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XPD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XPM n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Common-source second stage with mirrored current-sink load.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=6
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=6

* Series-R Miller compensation.
RZ n1 nc 700
CC nc out 700f

.ends dut
