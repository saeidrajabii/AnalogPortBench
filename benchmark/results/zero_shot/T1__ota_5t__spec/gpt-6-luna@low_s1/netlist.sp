.subckt dut iref inp inn out
* Reference sink and NMOS tail-current mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNTAIL net_tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Five-transistor OTA: NMOS differential pair and PMOS current-mirror load
XMNINP net_left inp net_tail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMNINN net_right inn net_tail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMPD net_left net_left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPM out net_left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
