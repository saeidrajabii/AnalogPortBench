.subckt dut iref inp inn out
* Reference current is converted to a voltage by a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Mirrored bias currents: 50 uA differential-pair tail and
* 20 uA for the PMOS current-mirror reference.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* NMOS differential input stage with a PMOS mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XINN nfirst inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XPLEFT nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=38 L=1.5 nf=1 m=1
XPRIGHT nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=38 L=1.5 nf=1 m=1

* Common-source output stage, nominally biased near 100 uA.
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XNOUT out nfirst 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=1.5 nf=1 m=1

* Miller compensation with a series zero-nulling resistor.
RZ nfirst ncomp 800
CC ncomp out 700f
.ends dut
