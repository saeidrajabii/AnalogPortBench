.subckt dut iref inp inn out
* Reference diode: sinks the 20 uA ideal current from iref
XMr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source, mirrored from iref (1:1, about 20 uA)
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS differential pair
XM2 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XM1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* PMOS mirror load: diode on the inp side, mirror output on the out side
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP0 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
