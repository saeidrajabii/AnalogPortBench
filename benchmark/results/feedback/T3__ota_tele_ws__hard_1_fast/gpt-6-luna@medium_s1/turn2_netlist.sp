.subckt dut iref inp inn out
* 20 uA reference current is sunk by the diode-connected NMOS.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* Tail-current mirror: nominally 80 uA.
XMNTail ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XMNINL nl inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMNINR out inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMPLOADR out nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
.ends dut
