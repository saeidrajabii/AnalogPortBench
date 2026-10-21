.subckt dut iref inp inn out
* Bias: iref drives diode MNb0 (20 uA reference)
XMb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail current source: 2x mirror -> 40 uA
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS bias generator: 20 uA through diode PMOS vbp
XMb1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMd vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Second-stage current source: 4.5x -> 90 uA
XMs2 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1
* Input differential pair (tail = 40 uA)
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XM2 na inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* PMOS active load (mirror)
XMp1 na na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMp2 n1 na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output common-source NMOS
XMo out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
* Miller compensation
Cc n1 out 0.4p
.ends dut
