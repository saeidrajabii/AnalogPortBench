.subckt dut iref inp inn out

* Reference current is received by a diode-connected NMOS.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Cascode biases generated using a mirrored reference current.
RBNC vdd vbnc 5k
RBPC vbnc vbpc 32.5k
CBNC vbnc 0 2p
CBPC vbpc vdd 2p

* Differential input stage.
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMNINM nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XMNINP nright inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1

* Longer-channel input-stage cascodes.
XMNCASM nmirror vbnc nleft 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XMNCASP nstage vbnc nright 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1

* PMOS mirror and cascoded active load.
XMPREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XMPMIR npcas nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XMPCAS nstage vbpc npcas vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1

* Output gain stage with cascoded mirrored current sink.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=450 L=1.05 nf=1 m=1
XMNOUT noutsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=10
XMNOUTCAS out vbnc noutsink 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.7 nf=1 m=1

* Miller compensation with series zero-setting resistance.
RCOMP nstage ncomp 1.4k
CCOMP ncomp out 550f

.ends dut
