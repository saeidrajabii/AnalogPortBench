.subckt dut iref inp inn out
* Bias: diode-connected reference sink (gate node = iref, 20 uA ideal into iref)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
* Tail current sink, mirror ratio 2 (about 40 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
* NMOS differential input pair
XMinn nA inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMinp nB inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS current-mirror load (diode on the inn side)
XMp1 nA nA vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XMp2 nB nA vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
* Second stage: PMOS common source driven by nB, NMOS current sink (ratio 4, about 80 uA)
XMp3 out nB vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XMs2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
* Miller compensation from first-stage output to out
Cc nB out 1p
.ends dut
