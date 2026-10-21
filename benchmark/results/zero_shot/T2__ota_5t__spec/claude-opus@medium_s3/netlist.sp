.subckt dut iref inp inn out
* ---- bias: NMOS diode sinks iref, mirrored to a PMOS diode ----
XN1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN2 nb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XP1 nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* ---- tail current source (2x = 40 uA) ----
XP2 tail nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=2
* ---- PMOS input pair (bulk tied to common source) ----
XP3 n1 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XP4 out inp tail tail sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
* ---- NMOS current-mirror load ----
XN3 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XN4 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
.ends dut
