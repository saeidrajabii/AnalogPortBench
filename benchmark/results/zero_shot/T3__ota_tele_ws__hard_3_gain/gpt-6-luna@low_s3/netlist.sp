.subckt dut iref inp inn out
* Reference-current NMOS mirror. The reference current is sunk at iref;
* it is not connected to the source of a transistor.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS bias generator, referenced to the NMOS mirror.
XMPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNPB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load.
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Second common-source gain stage and its mirrored PMOS load.
XMOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1

* Miller compensation.
CCOMP n2 out 2p
.ends dut
