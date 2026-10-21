.subckt dut iref inp inn out
* ---------------- bias reference (20 uA) ----------------
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
* tail current source (60 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=3

* ---------------- NMOS cascode bias (vcn), tracks input CM ----------------
* 10 uA PMOS source
XMB6 vpb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMB5 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB4 vcn vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* replica cascode diode (same current density as M3/M4)
XMB2 vcn vcn nr1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
* Vds margin for input pair (10 uA * 14k = 0.14 V)
RB1  nr1 nr2 14k
* replica input device (follower, same density as M1/M2) -> nr2 ~ tail
XMR1 vdd inp nr2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMR2 nr2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* ---------------- PMOS cascode bias (vcp) ----------------
* 10 uA * 18k = 0.18 V across M7/M8
RB2  vdd ny 18k
XMB7 vcp vcp ny vdd sky130_fd_pr__pfet_01v8_lvt W=13.33 L=0.7 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* ---------------- telescopic cascode OTA ----------------
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
.ends dut
