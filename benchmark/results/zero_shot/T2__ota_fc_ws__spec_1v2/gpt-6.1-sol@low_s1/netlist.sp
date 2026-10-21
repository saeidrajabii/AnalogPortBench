* Two-stage, Miller-compensated SKY130 port.
* Candidate sizing; specification compliance requires model-based simulation.
* Global supply node: vdd = 1.2 V.
.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Nominal 80 uA differential-pair tail current.
XMPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4

* PMOS differential pair with NMOS current-mirror load.
* Two inversions give positive overall gain from inp to out.
XMPINP diode inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMPINN stage1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNLD diode diode 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNLM stage1 diode 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage, nominally biased at 160 uA.
XMPOS out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
XMNOS out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Miller compensation with series zero-control resistance.
RZERO stage1 comp 500
CCOMP comp out 1.8p

.ends dut
