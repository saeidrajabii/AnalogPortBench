.subckt dut iref inp inn out

* Diode-connected reference and NMOS current mirrors.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=5
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=11

* NMOS differential input stage with PMOS mirror load.
XMNINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XMNINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XMPDIO mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XMPLOAD first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

* Inverting second stage.
XMPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=0.8 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP first comp 400
CCOMP comp out 850f

.ends dut
