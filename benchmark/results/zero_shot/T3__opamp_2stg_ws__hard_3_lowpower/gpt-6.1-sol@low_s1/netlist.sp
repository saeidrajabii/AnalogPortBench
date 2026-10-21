.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* NMOS differential input stage with PMOS mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XINN nstage inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1
XPR nstage nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

* Inverting second stage with mirrored current-sink load.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.75 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 3k
CCOMP ncomp out 700f

.ends dut
