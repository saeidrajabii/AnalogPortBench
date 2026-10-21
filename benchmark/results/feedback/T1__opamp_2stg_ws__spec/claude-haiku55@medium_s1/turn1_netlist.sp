.subckt dut iref inp inn out
* ---- Bias: NMOS mirror referenced to iref (20 uA) ----
* Diode-connected reference, iref at drain/gate (not source)
XMref  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source: 2x reference -> 40 uA
XMtail tl   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Second-stage current sink: 6x reference -> 120 uA
XMout  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* ---- First stage: NMOS differential pair with PMOS mirror load ----
* M1 (diode side) gate = inn, M2 (output side) gate = inp
XM1    d1   inn tl 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XM2    o1   inp tl 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
* PMOS mirror: P1 diode-connected, P2 mirrors into o1
XP1    d1   d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP2    o1   d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* ---- Second stage: PMOS common source, NMOS current sink (out) ----
* Gate-width ratio 120/20 to P1 gives ~120 uA at the same Vsg
XP3    out  o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* ---- Miller compensation with nulling resistor ----
Rz o1 nz 3k
Cc nz out 500f
.ends dut
