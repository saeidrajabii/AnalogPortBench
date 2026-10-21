.subckt dut iref inp inn out
* Bias: iref (20 uA) into a diode-connected NMOS; the tail mirrors it 2:1 (about 10 uA)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Input pair: wide devices biased in weak inversion for maximum gm/Id
XM1  net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XM2  out  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
* PMOS current-mirror load
XM3  net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4  out  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
