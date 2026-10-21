.subckt dut iref inp inn out
* ---- reference and tail (20 uA reference, 90 uA tail) ----
XMrefn iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMtail tn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1

* ---- PMOS bias generator (pd = PMOS diode, ~5 uA) ----
XMcopy pd iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMpd pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- PMOS cascode bias vbp_c (~0.5 V) ----
XMps_c q pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMpd2 vbp_c vbp_c q vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMnc2 vbp_c iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* ---- NMOS cascode bias vbn_c (~0.9 V) ----
XMps_n vbn_c pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMnd1 vbn_c vbn_c xn 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMnd2 xn xn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- input pair (45 uA each) ----
XMin_p net010 inp tn 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMin_n net016 inn tn 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* ---- folded PMOS top sources and cascodes ----
XMa_top net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=0.5 nf=1 m=1
XMb_top net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.5 nf=1 m=1
XMc_a net1 vbp_c net010 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMc_o out vbp_c net016 vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1

* ---- NMOS output cascode and sink (45 uA) ----
XMn_o out vbn_c net017 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XMsink_o net017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=1

* ---- fold-node sink (10 uA) ----
XMn6 net1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends dut
