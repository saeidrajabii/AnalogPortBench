.subckt dut iref inp inn out
* bias mirror (iref = 20 uA)
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XB2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=3
* first stage: NMOS diff pair, PMOS mirror load
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM4 x d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* second stage: PMOS common source
XM6 out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=6
* Miller compensation with nulling resistor
Rz x nz 1.5k
Cc nz out 0.8p
.ends dut
