.subckt dut iref inp inn out
* Reference-current mirror
XNR0 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1.2 nf=1 m=1
XNR1 iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Input differential pair
XNT tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XNI0 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNI1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Cascoded PMOS active load
RBP0 vdd pc_bias 700k
RBP1 pc_bias 0 500k
XPL0 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XPL1 pc_src nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XPC1 n1 pc_bias pc_src vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Second stage and cascoded current sink
XPO out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=85 L=1.8 nf=1 m=1
XNO0 ns nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XNO1 out iref ns 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=1.8 nf=1 m=1

* Miller compensation
RC n1 nc 3.5k
CC nc out 850f
.ends dut
