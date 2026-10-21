.subckt dut iref inp inn out
* ---- reference and tail (20 uA reference, 60 uA tail) ----
XMrefn iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XMtail tn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=1 nf=1 m=1

* ---- PMOS bias generator (pd = PMOS diode, 5 uA) ----
XMcopy pd iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMpd pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* ---- PMOS cascode bias vbp_c (NMOS diode, ~0.5 V) ----
XMps_c vbp_c pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMnd_p vbp_c vbp_c 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=1 nf=1 m=1

* ---- NMOS cascode bias vbn_c (NMOS diode, ~0.66 V) ----
XMps_n vbn_c pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMnd1 vbn_c vbn_c 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.84 L=1 nf=1 m=1

* ---- input pair (30 uA each) ----
XMin_p net010 inp tn 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XMin_n net016 inn tn 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1

* ---- folded PMOS top sources and cascodes ----
XMa_top net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XMb_top net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1 nf=1 m=1
XMc_a net1 vbp_c net010 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMc_o out vbp_c net016 vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=1

* ---- NMOS output cascode and sink (45 uA) ----
XMn_o out vbn_c net017 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=1 nf=1 m=1
XMsink_o net017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=1 nf=1 m=1

* ---- fold-node sink (10 uA) ----
XMn6 net1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
.ends dut
