.subckt dut in out
* Reference branch: in -> MN3 (cascode, gate vc) -> MN1 (mirror, gate vg) -> 0
XM3 in vc r1 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XM1 r1 vg 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* Output branch: out -> MN2 (cascode, gate vc) -> MN0 (mirror, gate vg) -> 0
XM2 out vc n2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XM0 n2 vg 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* Bias for mirror gate vg (~1 uA, same current density as MN1/MN0)
RB1 vdd vg 680k
XMB1 vg vg 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=2 nf=1 m=1
* Bias for cascode gate vc (~1 uA, higher current density for a larger Vgs)
RB2 vdd vc 630k
XMB2 vc vc 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=2 nf=1 m=1
.ends dut
