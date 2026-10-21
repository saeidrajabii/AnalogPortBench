.subckt dut iref inp inn out
* The 20 uA reference drives diode-connected NMOS devices; its current
* is mirrored to the input-pair tail and the cascoded output sink.
XNR0 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1.2 nf=1 m=1
XNR1 iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

XNT tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XNI0 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=23 L=1.2 nf=1 m=1
XNI1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=23 L=1.2 nf=1 m=1

XPL0 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XPL1 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.2 nf=1 m=1

XPO out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=144 L=1.8 nf=1 m=1
XNO0 ns nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XNO1 out iref ns 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

RC n1 nc 2k
CC nc out 1p
.ends dut
