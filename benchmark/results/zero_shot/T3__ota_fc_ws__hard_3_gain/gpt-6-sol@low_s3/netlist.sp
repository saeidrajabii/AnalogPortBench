.subckt dut iref inp inn out
* Reference current is converted to a gate bias before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XINN nfirst inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XPLOAD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPLOAD2 nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage with mirrored current-sink bias.
XPOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* Miller compensation with a series zero-nulling resistor.
RNULL nfirst ncomp 2k
CCOMP ncomp out 1.5p
.ends dut
