.subckt dut iref inp inn out
* ---- bias: iref is mirrored by a diode-connected NFET (unit W=7 L=2 carries ~10 uA) ----
XMREF  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=7  L=2   nf=1 m=2
XMTAIL tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=7  L=2   nf=1 m=5
XMSINK out  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=7  L=2   nf=1 m=8
* ---- first stage: NMOS differential pair with PMOS current-mirror load ----
XM1 n9 inn tail 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1   nf=1 m=1
XM2 n8 inp tail 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1   nf=1 m=1
XM3 n9 n9  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 n8 n9  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* ---- second stage: PMOS common source, NMOS current-sink load ----
XM6 out n8 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=6
* ---- Miller compensation with nulling resistor ----
RZ n8 nz 2.5k
CC nz out 0.75p
.ends dut
