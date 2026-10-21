.subckt dut iref inp inn out

* 20 uA reference sink and scaled NMOS bias mirrors
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMTAIL vbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
XMPBIAS vpref vpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPSINK vpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMTAIL tail vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3

* Second gain stage and mirrored PMOS current-source load
XMOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPL out vpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=3

* Miller compensation
CCOMP n2 out 1p

.ends dut
