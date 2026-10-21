.subckt dut iref inp inn out
* ---- Bias ----
* Reference diode (20 uA from iref); tail/sink gate vb4 = iref
MBN1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Cascode gate vb3 ~0.6 V (resistor divider)
RB3T vdd vb3 40k
RB3B vb3 0 40k
* PMOS cascode gate vb2 ~0.2 V (resistor divider)
RB2T vdd vb2 200k
RB2B vb2 0 40k

* ---- Tail and input pair ----
MT nt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
MIP n010 inp nt 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1
MIN n016 inn nt 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1

* ---- PMOS mirror load (gate n1) ----
MPC1 n1 vb2 n010 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
MPL1 n010 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
MPL2 n016 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
MP5 out vb2 n016 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* ---- NMOS sinks and cascodes ----
MN6 n1 vb3 n018 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
MN7 n018 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
MN9 out vb3 n017 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
MN8 n017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
.ends dut
