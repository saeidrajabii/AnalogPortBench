.subckt dut iref inp inn out
* 20 uA reference sink and 1:2 NMOS current mirror for the OTA tail.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* Five-transistor OTA: NMOS differential pair with PMOS current-mirror load.
XMNI   nleft inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMNP   nright inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMPREF nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPLOAD out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
.ends dut
