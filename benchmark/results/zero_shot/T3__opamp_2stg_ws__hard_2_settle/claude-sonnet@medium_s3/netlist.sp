.subckt dut iref inp inn out
* bias mirror
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=3
XMS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=10
* input pair (out is inn in follower; inn drives gate of mirror-side device)
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS mirror load
XP1 d2 d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XP0 d1 d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=1
* second stage
XP2 out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
* compensation
RC d1 nc 1k
CC nc out 0.6p
.ends dut
