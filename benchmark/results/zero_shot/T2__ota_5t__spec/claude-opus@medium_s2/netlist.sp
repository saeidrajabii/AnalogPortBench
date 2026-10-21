.subckt dut iref inp inn out
* Bias: NMOS diode sinks the 20 uA reference and is mirrored 1:3 into the tail (60 uA)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=3
* NMOS input pair, bulk tied to source to remove body effect and save headroom
XM1  net9 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM2  out  inn tail tail sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* PMOS current-mirror load
XM3  net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XM4  out  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
