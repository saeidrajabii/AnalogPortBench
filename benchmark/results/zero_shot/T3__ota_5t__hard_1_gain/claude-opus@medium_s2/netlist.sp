.subckt dut iref inp inn out
* Bias: iref (20uA) -> NMOS diode -> 1/2 mirror (10uA) -> PMOS diode -> 2x tail mirror (20uA)
XMN_D  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMN_M  vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP_D  vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=2
XMP_T  tail vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
* PMOS input pair (bulk tied to source node to lower |Vgs| and give the tail more headroom)
XMP_IN1 nmir inn tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=3
XMP_IN2 out  inp tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=3
* NMOS current-mirror load (long L for output resistance)
XMN_L1 nmir nmir 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
XMN_L2 out  nmir 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
.ends dut
