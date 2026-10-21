.subckt dut iref inp inn out
* Bias: diode-connected NMOS sinks iref; tail mirrors ~10.5 uA (21/40 ratio)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=40
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=21
* Input pair (weak inversion, for high gm/Id)
XM1  n9  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2  out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  n9  n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4  out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
