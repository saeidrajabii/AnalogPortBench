.subckt dut iref inp inn out
* The 20 uA reference current flows through two diode-connected NFETs.
* Their voltages bias the current-sink mirrors and output NFET cascode.
XNR1 iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XNR2 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* PMOS mirror reference.
XNB pb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1

* Differential input stage and current-mirror load.
XNT tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XNI1 first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XNI2 mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XPL1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XPL2 first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1

* Cascoded output stage.
XPO1 pout first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=1.5 nf=1 m=1
XPO2 out pcas pout vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.75 nf=1 m=1
XNO1 nsink nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XNO2 out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1

* Output PMOS cascode bias and Miller compensation.
RPC1 vdd pcas 180k
RPC2 pcas 0 100k
RC first comp 3k
CC comp out 700f
.ends dut
