.subckt OTA_5T Vbiasn vm vout vp
XMTAIL net10 Vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMNI net9 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMNN vout vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPL vout net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMPD net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XI1 iref inn out inp OTA_5T
.ends dut
