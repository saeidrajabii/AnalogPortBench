.subckt dut iref inp inn out
* Bias: diode-connected reference NMOS at iref (20 uA mirrored from ideal source)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Tail current source (1:1, 20 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS input differential pair
XMinp d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMinn d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS current-mirror active load (d1 is diode-connected)
XMp1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink (5x, 100 uA)
XMp3 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMn3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
* Miller compensation with nulling resistor
Rz d2 x 2k
Cc x out 0.5p
.ends dut
