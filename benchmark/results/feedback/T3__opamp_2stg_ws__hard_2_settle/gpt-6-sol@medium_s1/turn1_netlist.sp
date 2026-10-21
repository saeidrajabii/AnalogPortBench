.subckt dut iref inp inn out
* The 20 uA reference is converted to NMOS mirror biases.
XREF_LO nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XREF_HI iref iref nref 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* NMOS differential input stage and PMOS mirror load.
XTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=6
XIN_N pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XIN_P gain1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XLOAD_D pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.8 nf=1 m=1
XLOAD_M gain1 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.8 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XOUT_P out gain1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=500 L=0.8 nf=1 m=1
XSINK_B sink nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=9
XSINK_C out iref sink 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=9

* Miller compensation with a series nulling resistor.
RNULL gain1 comp 1.2k
CCOMP comp out 1.1p
.ends dut
