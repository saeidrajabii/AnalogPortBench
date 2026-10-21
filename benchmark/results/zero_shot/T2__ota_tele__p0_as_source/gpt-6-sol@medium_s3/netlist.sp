.subckt dut iref inp inn out
* Reference-current mirror and tail-current source
XBNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* Output-stage bias: 20 uA reference mirrored to approximately 100 uA
XBBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=19 L=1.2 nf=1 m=1
XBPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=95 L=1.2 nf=1 m=1

* Differential input stage with current-mirror load
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XPLREF n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1.2 nf=1 m=1
XPLMIR n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation
XNOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1.2 nf=1 m=1
CCOMP n2 nc 0.7p
RZERO nc out 1.2k
.ends dut
