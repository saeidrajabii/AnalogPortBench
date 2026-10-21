.subckt dut iref inp inn out
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

XMNIN net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMNINV out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

XMPD net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMPM out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
.ends dut
