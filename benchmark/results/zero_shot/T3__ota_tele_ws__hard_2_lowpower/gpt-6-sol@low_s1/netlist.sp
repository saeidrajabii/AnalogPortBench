.subckt dut iref inp inn out
* The reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBIASN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1

* First gain stage: NMOS differential pair with a PMOS mirror load.
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1 nf=1 m=1
XINN md inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1 nf=1 m=1
XLOADD md md vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XLOADM x md vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1

* Second gain stage and its mirrored PMOS bias current.
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XOUTP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XOUTN out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=1.2 nf=1 m=1

* Miller compensation with a series zero-nulling resistor.
RZ x cz 2k
CC cz out 0.8p
.ends dut
