.subckt dut iref inp inn out
* ---- Bias: NMOS mirror referenced to iref (20 uA) ----
XMref  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source: 2x reference -> 40 uA
XMtail tl   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Cascode gate voltages (resistive dividers from vdd)
* vbn ~ 1.05 V for the NMOS output-sink cascode
Rtop_n vdd vbn 143k
Rbot_n vbn 0 200k
* vb4 ~ 0.65 V for the PMOS output cascode
Rtop_p vdd vb4 355k
Rbot_p vb4 0 200k

* ---- First stage: NMOS differential pair with PMOS mirror load ----
* M1 (diode side) gate = inn, M2 (output side) gate = inp
XM1    d1   inn tl 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XM2    o1   inp tl 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
* PMOS mirror: P1 diode-connected, P2 mirrors into o1
* Same W/L as before (20/1) but shorter L: halves mirror-node capacitance
XP1    d1   d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2    o1   d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- Second stage: cascoded PMOS common source, cascoded NMOS sink ----
* P3 (bottom) gate = o1, P4 (top cascode) gate = vb4
XP3    x    o1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XP4    out  vb4 x   vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* Sink: NS (bottom, gate = iref), NC (top cascode, gate = vbn); 6x reference -> 120 uA
XMs1   x2   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMs2   out  vbn  x2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* ---- Miller compensation with nulling resistor ----
Rz o1 nz 3k
Cc nz out 500f
.ends dut
