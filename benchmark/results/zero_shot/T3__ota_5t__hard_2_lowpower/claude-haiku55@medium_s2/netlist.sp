.subckt dut iref inp inn out
* Reference diode: 20 uA set by the ideal source at iref (W/L = 10/1)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Tail mirror: half width, about 10 uA
XMtail net10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
* Input differential pair, weak inversion for high gm/Id
XMinp net9 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1 nf=1 m=1
XMinn out inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1 nf=1 m=1
* PMOS active load mirror, about 5 uA per branch
XMp1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
