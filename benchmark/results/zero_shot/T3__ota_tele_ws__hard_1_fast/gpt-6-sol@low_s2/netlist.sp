.subckt dut iref inp inn out
* Reference current is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1

* Differential-pair tail current: nominally six times the reference current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XINP left_src inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XINN right_src inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Generate and mirror the NMOS cascode bias.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XPCAS cas_bias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XNCASREF cas_bias cas_bias cas_src 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.35 nf=1 m=1
XNCASSINK cas_src iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1

* Cascoded differential branches and PMOS mirror load.
XCASL mirror_node cas_bias left_src 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.35 nf=1 m=1
XCASR out cas_bias right_src 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.35 nf=1 m=1
XPLOADL mirror_node mirror_node vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPLOADR out mirror_node vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Establish the PMOS bias from a mirrored copy of the reference current.
XNPBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
.ends dut
