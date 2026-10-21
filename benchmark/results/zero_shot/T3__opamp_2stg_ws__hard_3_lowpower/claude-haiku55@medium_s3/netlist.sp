.subckt dut iref inp inn out
* Reference: diode-connected NMOS, sinks the 20 uA reference current at iref
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source: mirror ratio 1.5 -> ~30 uA
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* PMOS bias generation: NMOS mirror (~20 uA) feeding a PMOS diode; nb = PMOS bias voltage
XMb nb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMpd nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* First stage: NMOS differential pair
* inp drives the device whose drain is the output node n1 (keeps vout non-inverting w.r.t. inp)
* inn (= out in follower) drives the diode-side device
XM1 na inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* First stage: PMOS current-mirror active load
XMpa na na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMpb n1 na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Second stage: NMOS common source with PMOS current-source load (~60 uA)
XMs2 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMpl out nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
* Miller compensation with nulling resistor
RZ n1 nz 3k
CC nz out 500f
.ends dut
