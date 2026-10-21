* SKY130 low-voltage two-stage amplifier.
* Candidate sizing; compliance requires verification with the supplied
* SKY130 models and testbench.

.subckt dut iref inp inn out

* Reference current enters a diode-connected drain, then is mirrored.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* Auxiliary PMOS bias branch.
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Nominal 60-uA differential-pair tail.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=3

* NMOS differential input stage with PMOS mirror load.
XMNINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMNINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPDIO mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1
XMPLOAD first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1

* Common-source output stage, nominally biased at 120 uA.
XMPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=0.6 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=6

* Series-resistor Miller compensation.
RCOMP first comp 650
CCOMP comp out 650f

.ends dut
