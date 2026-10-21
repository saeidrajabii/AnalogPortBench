.subckt dut iref inp inn out
* Reference-current mirror. The reference current enters a diode-connected drain.
XREF_LO nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XREF_HI iref iref nref 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Set the input-cascode gate below iref to provide drain-source headroom.
RBIAS_H iref ncas 180k
RBIAS_L ncas nref 180k

* Cascoded differential input stage and PMOS mirror load.
XTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=6
XIN_N dn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XIN_P dp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XCAS_N pd ncas dn 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XCAS_P gain1 ncas dp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XLOAD_D pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1.8 nf=1 m=1
XLOAD_M gain1 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1.8 nf=1 m=1

* Second gain stage and cascoded output current sink.
XOUT_P out gain1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=650 L=1.2 nf=1 m=1
XSINK_B sink nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=10
XSINK_C out iref sink 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=10

* Miller compensation.
RNULL gain1 comp 1.3k
CCOMP comp out 1.8p
.ends dut
