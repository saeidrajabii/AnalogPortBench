.subckt dut iref inp inn out
* 20 uA reference mirror; differential-pair tail current is nominally 60 uA.
XMREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMTAIL tail  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XM1   nleft inp tail 0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2   nright inn tail 0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP1  nleft nleft vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP2  nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS output-stage current-source bias, nominally 30 uA.
XMBIASN nbiasn iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XMBIASP pbias  pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMBIASN2 pbias iref 0   0    sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1

* Second gain stage.
XMOUT out nright 0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMPLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Miller compensation.
CCOMP nright out 1p
.ends dut
