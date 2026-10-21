.subckt dut iref inp inn out
* Reference diode: sinks the 20 uA reference, drain = gate = iref
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail mirror: 1.5x reference, about 30 uA
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
* Input pair (inp drives the diode-side device, so the gain is non-inverting)
XMinp net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMinn out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
* PMOS current-mirror load
XMp1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMp2 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
.ends dut
