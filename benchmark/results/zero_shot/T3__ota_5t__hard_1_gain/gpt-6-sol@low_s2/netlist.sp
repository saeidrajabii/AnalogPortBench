.subckt dut iref inp inn out
* Reference current is accepted by a diode-connected NMOS and mirrored
* into the amplifier; it does not enter a transistor source directly.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XLOAD2 first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS bias mirror and common-source output stage.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Miller compensation with a series nulling resistor.
RNULL first comp 2k
CCOMP comp out 0.85p
.ends dut
