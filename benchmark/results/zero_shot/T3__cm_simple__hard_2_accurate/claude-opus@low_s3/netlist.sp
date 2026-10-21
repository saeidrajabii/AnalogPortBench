.subckt dut in out
* Reference side: M1's gate is at in, and Rd sets M1's drain voltage (node a) to about 0.1 V
XM1  a  in 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=4
Rd   in a 14k
* Output side: mirror device Mo plus regulated cascode Mc
XMo  b  in 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=4
XMc  out g b 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=2
* Error amplifier (PMOS input pair) forces V(b)=V(a)
Rb   pb 0 350k
XMb  pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMt  t  pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM3  d3 a  t  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4  g  b  t  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM5  d3 d3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XM6  g  d3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
.ends dut
