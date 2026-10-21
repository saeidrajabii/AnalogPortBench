.subckt dut iref inp inn out
* Reference-current mirror and cascode bias.
XREF_LO nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XREF_HI iref iref nref 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Cascoded differential input stage with a PMOS mirror load.
XTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=6
XIN_N dn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XIN_P dp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XCAS_N pd iref dn 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XCAS_P gain1 iref dp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XLOAD_D pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1
XLOAD_M gain1 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XOUT_P out gain1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=650 L=0.8 nf=1 m=1
XSINK_B sink nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=10
XSINK_C out iref sink 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=10

* Miller compensation with a left-half-plane zero.
RNULL gain1 comp 2.5k
CCOMP comp out 1.1p
.ends dut
