.subckt dut iref inp inn out
* 20 uA reference sink; mirrored currents set the input-pair tail and output sink.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
XNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5

* NMOS input pair with PMOS current-mirror load.
XMNREF nref inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.6 nf=1 m=1
XMNOUT n1 inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.6 nf=1 m=1
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XMPMIR n1 nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.2 nf=1 m=1

* Common-source PMOS output stage; its device ratio sets the quiescent current.
XMPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1.2 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZ n1 ncomp 500
CC ncomp out 1p
.ends dut
