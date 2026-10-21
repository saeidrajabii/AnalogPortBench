* Two-stage, Miller-compensated low-voltage amplifier.
* Candidate port; performance requires verification with the supplied
* SKY130 models and testbench.

.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Generate a 2 uA PMOS bias reference from the mirrored current.
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* Nominal 8 uA input-stage tail current.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* PMOS differential input pair.
XINP n1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XINN n2 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* NMOS current-mirror load.
XLD n2 n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XLM n1 n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Common-source output stage, nominally biased at 14 uA.
XOUTP out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=2 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RZ n1 nc 4k
CC nc out 0.7p

.ends dut
