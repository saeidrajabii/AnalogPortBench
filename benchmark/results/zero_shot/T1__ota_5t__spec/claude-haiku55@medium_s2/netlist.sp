.subckt dut iref inp inn out
* Reference: iref sinks 20 uA through diode-connected NMOS (W/L = 8)
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias copy: NMOS mirror (ratio 1/2) sinks 10 uA from PMOS bias diode
XMNm vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS diode generating the tail gate voltage vbp (carries 10 uA)
XMPb vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* PMOS tail current source, 3x the bias diode -> about 30 uA
XMPt tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
* PMOS input pair: inp on the diode side, inn on the output side
XMPp1 d inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMPp2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
* NMOS current-mirror load (1:1), long channel for output resistance
XMNl1 d d 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNl2 out d 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
