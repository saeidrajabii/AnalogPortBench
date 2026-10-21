.subckt dut iref inp inn out
* ---------------- Bias: iref through a stacked diode pair ----------------
* nb1  = current-source gate bias (~0.5 V)
* iref = cascode gate bias (~1.0 V); iref enters a drain, not a source
XMcd iref iref nb1  0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XMbd nb1  nb1  0    0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=1

* ---------------- Stage 1: NMOS differential pair, PMOS mirror load ----------------
* Tail current 60 uA (3x mirror of the 20 uA reference)
XMt  tail nb1  0    0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=3
XM1  n8   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XM2  n9   inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XM3  n9   n9   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM4  n8   n9   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* ---------------- Stage 2: PMOS common source, cascoded NMOS sink ----------------
* Sink current about 260 uA (13x mirror)
XM5  out  n8   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.35 nf=1 m=6
XM6  out  iref nc   0 sky130_fd_pr__nfet_01v8_lvt W=8  L=0.5 nf=1 m=13
XM7  nc   nb1  0    0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=13

* ---------------- Miller compensation with nulling resistor ----------------
RZ   n8  nz  900
CC   nz  out 0.6p
.ends dut
