.subckt dut in out
* Reference and output devices form a low-voltage NMOS current mirror.
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1 nf=1 m=1
XOUT out vg 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1 nf=1 m=1

* Output-voltage feedforward reduces the output device's gate bias as
* out rises. The large divider resistances minimize current drawn from out.
RBIAS in vg 1k
XCOMP vg sense vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=10 nf=1 m=1
RHI out sense 100T
RLO sense 0 150T
.ends dut
