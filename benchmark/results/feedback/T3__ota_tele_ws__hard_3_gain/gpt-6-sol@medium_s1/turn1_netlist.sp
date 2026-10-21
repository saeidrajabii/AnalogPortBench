.subckt dut iref inp inn out
* Reference current is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Cascode-gate biases.
RNC1 vdd ncas_bias 470k
RNC2 ncas_bias 0 730k
RPC1 vdd pcas_bias 930k
RPC2 pcas_bias 0 270k

* Differential first stage. The left PMOS is diode-connected to establish
* the load-mirror bias; the right-hand cascode drain drives the second stage.
XINL nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.7 nf=1 m=1
XINR nr inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.7 nf=1 m=1
XNCL pl ncas_bias nl 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XNCR gain_node ncas_bias nr 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

XPTL ptop ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPTR pr ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPCL pl pcas_bias ptop vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1
XPCR gain_node pcas_bias pr vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUTN out gain_node 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=2.5 nf=1 m=1
XOUTP out ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=2.5 nf=1 m=1
RNULL gain_node comp 1.5k
CCOMP comp out 1.5p
.ends dut
