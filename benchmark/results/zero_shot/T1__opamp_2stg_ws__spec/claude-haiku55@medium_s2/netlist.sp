.subckt dut iref inp inn out
* Bias: diode-connected reference (iref) mirrored to tail (1.5x -> 30 uA),
* second-stage sink (8x -> 160 uA). Ideal 20 uA reference enters at iref.
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMsink2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* First stage: NMOS differential pair (inn on mirror-diode side, inp on output side)
* with PMOS current-mirror load (15 uA per side).
XM1 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XM4 o1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1

* Second stage: PMOS common-source (160 uA) driven by o1.
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor (Cc = 500 fF, Rz = 3 k).
RR0 o1 nx 3k
CC0 nx out 500f
.ends dut
