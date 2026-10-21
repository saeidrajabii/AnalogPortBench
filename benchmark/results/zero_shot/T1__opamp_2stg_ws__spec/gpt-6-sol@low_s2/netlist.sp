.subckt dut iref inp inn out
* The 20 uA reference is diode-connected and mirrored into the amplifier.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN nstage inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XLOAD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
XLOAD2 nstage nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1

* Second gain stage and series-RC Miller compensation.
XOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.5 nf=1 m=1
RCOMP nstage ncomp 1.5k
CCOMP ncomp out 800f
.ends dut
