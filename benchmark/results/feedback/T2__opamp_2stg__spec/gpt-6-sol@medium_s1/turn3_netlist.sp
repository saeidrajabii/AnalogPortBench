.subckt dut iref inp inn out
* The reference current flows through diode-connected NMOS devices.
* Their gate voltages bias mirrored currents in the amplifier.
XNR0 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1.2 nf=1 m=1
XNR1 iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Differential input stage
XNT tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.5 L=1.2 nf=1 m=1
XNI0 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=95 L=1 nf=1 m=1
XNI1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=95 L=1 nf=1 m=1

* Balanced, cascoded PMOS current-mirror load
RBP0 vdd pc_bias 600k
RBP1 pc_bias 0 600k
XPL0 pcm0 pcm0 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=85 L=2 nf=1 m=1
XPL1 pcm1 pcm0 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=85 L=2 nf=1 m=1
XPC0 nd pc_bias pcm0 vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XPC1 n1 pc_bias pcm1 vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1

* Output stage
XPO out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2.5 nf=1 m=1
XNO0 ns nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XNO1 out iref ns 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* Miller compensation
RC n1 nc 2k
CC nc out 600f
.ends dut
