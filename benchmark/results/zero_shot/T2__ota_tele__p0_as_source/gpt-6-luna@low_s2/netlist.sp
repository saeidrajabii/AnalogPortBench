.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, 40 uA input-pair tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2

* Differential input pair and PMOS current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1

* PMOS output-stage bias, derived from the mirrored reference current.
XBIASSINK pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XBIASDIODE pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Second gain stage and dominant-pole compensation.
XOUTN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XOUTP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
CCOMP n1 out 1p
.ends dut
