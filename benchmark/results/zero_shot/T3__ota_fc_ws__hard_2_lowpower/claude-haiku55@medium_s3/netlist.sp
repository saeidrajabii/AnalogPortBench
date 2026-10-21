.subckt dut iref inp inn out
* Bias: NMOS reference diode mirrored to tail (20 uA), PMOS load mirror
* (diode M3 at 10 uA, M4 copy at 10 uA, M7 3x copy at 30 uA). Total supply ~70 uA.
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Stage 1: NMOS differential pair with PMOS mirror load
XM1 n3 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 out1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM3 n3 n3 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
XM4 out1 n3 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1

* Stage 2: NMOS common source with PMOS current-source load (3x mirror)
XM6 out out1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM7 out n3 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1 nf=1 m=1

* Miller compensation with nulling resistor
R1 out1 nz 5k
C1 nz out 1.7p
.ends dut
