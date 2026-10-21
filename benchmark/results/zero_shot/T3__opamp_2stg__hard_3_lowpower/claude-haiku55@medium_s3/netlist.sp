.subckt dut iref inp inn out
* ---- bias: reference diode and mirrors ----
XMref  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1   nf=1 m=1
XMtail tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1   nf=1 m=1
* ---- first stage: NMOS pair, PMOS mirror load ----
XM1  na inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=1
XM2  nb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=1
XMp1 na na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMp2 nb na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* ---- second stage: PMOS common source, NMOS sink ----
XMp3 out nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMn3 out iref 0   0 sky130_fd_pr__nfet_01v8_lvt W=32  L=1   nf=1 m=1
* ---- Miller compensation with nulling resistor ----
RZ  nb cmid 3k
CC  cmid out 0.3p
.ends dut
