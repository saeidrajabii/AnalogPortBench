.subckt dut iref inp inn out
* Two-stage Miller OTA with NMOS input pair, PMOS active load, and
* NMOS current sinks mirrored from the 20 uA reference (diode MNR).
* Targets: ~120 uA total supply current (~144 uW at 1.2 V).

* Bias: diode-connected NMOS on iref (current enters the drain/gate node, not a source)
XMNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* Tail current source, 2x reference = 40 uA
XMNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Stage 1: NMOS differential pair (inp on net08 side, inn on net9 side)
XMN1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN2 net9  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* Stage 1 PMOS active load (mirror: net9 diode-connected, net08 mirrored)
XMP1 net9  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP2 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* Stage 2: PMOS common-source driver with NMOS current-sink load (60 uA)
XMP3 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Miller compensation with nulling resistor
RZ net08 n012 3k
CC n012 out 500f
.ends dut
