.subckt CM_lvcas in out
* Self-biased low-voltage cascode mirror (Sooch-type bias through R1)
* Reference branch: Iref -> in -> R1 -> y -> M1c -> a -> M1 -> gnd
R1   in y 9k
XM1c y  in a 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=16
XM1  a  y  0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=8
* Output branch: identical to the reference branch
XM0c out in b 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=16
XM0  b   y  0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=8
.ends CM_lvcas

.subckt dut in out
XI0 in out CM_lvcas
.ends dut
