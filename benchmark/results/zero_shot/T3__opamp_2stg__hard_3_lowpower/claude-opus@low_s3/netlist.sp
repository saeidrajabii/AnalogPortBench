.subckt dut iref inp inn out
* bias: iref (20uA) into NMOS diode, mirrored to tail (20uA) and output sink (80uA)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* input pair (inp drives the second-stage-gate side for correct polarity)
XM1  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2  n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror load
XM3  n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XM4  n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* second stage
XM5  out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* Miller compensation with nulling resistor
RZ   n2 nc 1.5k
CC   nc out 350f
.ends dut
