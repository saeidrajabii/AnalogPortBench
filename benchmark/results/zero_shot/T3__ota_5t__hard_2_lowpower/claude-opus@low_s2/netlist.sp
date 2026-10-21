.subckt dut iref inp inn out
* Reference mirror: 20 uA diode, 10 uA tail (ratio 2:1)
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=2
* Input pair (wide, weak inversion for high gm/Id)
XM1  n9  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=2
XM2  out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=2
* PMOS mirror load
XMP1 n9  n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP0 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
