.subckt dut in out

* Reference branch: convert the reference current to a sense voltage.
XREF in in sref 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=20 nf=1 m=1
RREF sref 0 500

* Output branch, regulated to reproduce the reference sense voltage.
XOUT out vg sout 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=20 nf=1 m=1
ROUT sout 0 500

* Mirror-derived amplifier bias.
XBIASN pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=20 nf=1 m=1
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=20 nf=1 m=1
XTAIL tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=20 nf=1 m=2

* PMOS differential pair with NMOS current-mirror load.
* A rising output sense voltage lowers vg, providing negative feedback.
XINREF nload sref tail vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=20 nf=1 m=1
XINOUT vg sout tail vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=20 nf=1 m=1
XLOADREF nload nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=20 nf=1 m=1
XLOADOUT vg nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=20 nf=1 m=1

CSTAB vg 0 2p

.ends dut
