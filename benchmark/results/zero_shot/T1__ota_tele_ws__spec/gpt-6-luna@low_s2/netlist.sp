.subckt dut iref inp inn out
* Reference-current sink and 4:1 tail-current mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNT tail tail 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4

* NMOS differential pair with PMOS current-mirror load
XMNINP out inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNINN nref inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPLOAD out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
.ends dut
