.subckt dut iref inp inn out
* Reference-current mirror and cascode bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.8 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
RBIAS1 vdd ncb 480k
RBIAS2 ncb 0 720k

* Cascoded differential input stage
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XNC1 d1 ncb x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNC2 n1 ncb x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPT1 y1 y1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPC1 d1 d1 y1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPT2 y2 y1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPC2 n1 d1 y2 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* Output stage and Miller compensation
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
CCOMP n1 nc 0.9p
RZERO nc out 4k
.ends dut
