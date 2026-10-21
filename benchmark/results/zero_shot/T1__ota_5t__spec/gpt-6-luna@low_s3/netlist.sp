.subckt dut iref inp inn out
* Reference-current sink and 1:1 NMOS tail-current mirror
XMNREF vbias vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMTAIL ntail vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Differential pair
XMNINN nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNINP out inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS current-mirror load
XMPREF nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1
XMPLOAD out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1
.ends dut
