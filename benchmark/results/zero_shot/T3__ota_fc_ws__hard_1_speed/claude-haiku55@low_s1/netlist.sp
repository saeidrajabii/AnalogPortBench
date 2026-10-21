.subckt dut iref inp inn out
* ---- bias generation (20 uA reference from iref) ----
XMref  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMt    tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMb1   vbp1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XPd1   vbp1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMb2   vbp2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XPd2   vbp2 vbp2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.35 nf=1 m=1
XPb    vbn2 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XNd2   vbn2 vbn2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* ---- input pair and tail ----
XM1    fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.3 nf=1 m=1
XM2    fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.3 nf=1 m=1

* ---- PMOS current sources and cascodes ----
XPs1   fa vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPs2   fb vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPc1   c vbp2 fa vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPc2   out vbp2 fb vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1

* ---- NMOS folded mirror and output sink ----
XNm1   c c 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNm2   d c 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNc    out vbn2 d 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
.ends dut
