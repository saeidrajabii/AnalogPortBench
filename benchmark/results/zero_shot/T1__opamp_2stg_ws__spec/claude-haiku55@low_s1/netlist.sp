.subckt dut iref inp inn out
* Reference diode (20 uA set by ideal source from vdd into iref)
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* Tail current source, 2.5x mirror (~50 uA)
XM5 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* Second-stage current sink, 6.5x mirror (~130 uA)
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=78 L=1 nf=1 m=1
* NMOS differential pair (inn on the diode side, inp on the output side)
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS mirror load (M3 diode-connected)
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS common-source second stage
XM6 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
* Miller compensation
CC n2 out 1p
.ends dut
