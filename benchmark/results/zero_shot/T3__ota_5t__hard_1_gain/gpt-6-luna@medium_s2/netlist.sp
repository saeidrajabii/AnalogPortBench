.subckt dut iref inp inn out
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XMTAIL net10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XMNIN net9 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
XMNINN out inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
XMPLOAD net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
XMPMIRROR out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
.ends dut
