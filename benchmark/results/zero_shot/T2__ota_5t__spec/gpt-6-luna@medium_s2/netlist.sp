.subckt dut iref inp inn out
* Reference-current sink and mirrored PMOS bias
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load
XPT ps pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPI nl inn ps vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPP out inp ps vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XNL nl nl 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNO out nl 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
.ends dut
