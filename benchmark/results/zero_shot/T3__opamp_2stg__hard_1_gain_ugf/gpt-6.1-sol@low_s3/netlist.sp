.subckt dut iref inp inn out

* Stacked diode reference; reference current enters a drain.
XNR0 vb_n vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XNR1 iref iref vb_n 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* Differential-stage tail current: nominally 60 uA.
XNT tail vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=3

* NMOS differential pair.
XNI0 mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XNI1 stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* PMOS current-mirror load with a cascoded output branch.
XPL0 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPL1 p_int mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPLC stage1 vb_n p_int vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Common-source second stage.
XPO out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=280 L=2 nf=1 m=1

* Cascoded output sink: nominally 120 uA.
XNO0 n_int vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=6
XNO1 out iref n_int 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=6

* Series-R Miller compensation.
RC stage1 comp 750
CC comp out 650f

.ends dut
