.subckt dut in out
* Reference branch and current-sensing resistors.
XR in in ref_s 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=4 nf=1 m=1
RREF ref_s 0 2k

* Output branch.
XO out drive out_s 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=4 nf=1 m=1
ROUT out_s 0 2k

* Mirrored reference current generates the amplifier bias.
XBN pbias in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=1

* Differential feedback amplifier equalizes the sensed currents.
XP1 load ref_s tail vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XP2 drive out_s tail vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XN1 load load 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XN2 drive load 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1

CDOM drive 0 2p
.ends dut
