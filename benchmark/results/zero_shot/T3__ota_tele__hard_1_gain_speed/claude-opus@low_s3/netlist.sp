.subckt dut iref inp inn out
* bias: 20uA reference diode
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* cascode gate bias (4uA)
XB2 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=1 nf=1 m=1
XB3 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1 nf=1 m=1
* tail (16uA)
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.2 L=1 nf=1 m=1
* input pair
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* low-voltage cascode PMOS mirror load
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM6 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM3 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* second stage (~110uA)
XM7 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=11
XM8 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.5 L=1 nf=1 m=4
* Miller compensation with nulling resistor
Rz o1 nz 2.5k
Cc nz out 0.6p
.ends dut
