.subckt dut iref inp inn out

* Reference mirror: nominal 8 uA input-stage tail and 16 uA output bias.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XBOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XPLREF n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XPLMIR n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Common-source output stage.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZERO n1 nc 10k
CCOMP nc out 0.75p

* Candidate sizing; compliance requires simulation with the supplied models.
.ends dut
