.subckt dut iref inp inn out
* Bias: 20 uA reference diode-connected NMOS at iref (current enters a drain node, not a source)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.3 L=0.5 nf=1 m=1
* Tail current source, 2x mirror (~40 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.3 L=0.5 nf=1 m=2
* NMOS differential pair (inp -> stage-1 output net08, inn -> diode side net9)
XM1  net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2  net9  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load of first stage
XP1  net9  net9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP0  net08 net9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second stage: PMOS common-source driver and NMOS current sink (~160 uA)
XP2  out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XN5  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.3 L=0.5 nf=1 m=8
* Miller compensation
CC   net08 out 500f
.ends dut
