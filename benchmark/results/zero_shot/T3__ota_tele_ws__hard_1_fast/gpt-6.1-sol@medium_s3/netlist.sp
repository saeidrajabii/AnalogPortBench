.subckt dut iref inp inn out

* Reference-current mirror.
* The external reference terminates at a diode-connected drain/gate.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS current-source bias: nominally 20 uA.
XBP_SINK bp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XBP_DIODE bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21.333333 L=1 nf=1 m=1

* PMOS cascode bias from two diode-connected devices.
* Nominal bias-branch current: 5 uA.
XBPC_SINK bpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XBPC_UP bpc_mid bpc_mid vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XBPC_LOW bpc bpc bpc_mid vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* NMOS wide-swing cascode bias.
* Nominal bias-branch current: 5 uA.
XBNC_SOURCE bnc bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5.333333 L=1 nf=1 m=1
XBNC_DIODE bnc bnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.84 L=1 nf=1 m=1

* Input differential pair and mirrored 100-uA tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XINP fold_p inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XINN fold_n inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.35 nf=1 m=1

* Folding-node current sources: nominally 75 uA each.
XPS_P fold_p bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPS_N fold_n bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS folding cascodes: nominally 25 uA each at balance.
XPF_P mirror bpc fold_p vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPF_N out bpc fold_n vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* Wide-swing cascoded NMOS output-current mirror.
XNC_REF mirror bnc sink_ref 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNS_REF sink_ref mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XNC_OUT out bnc sink_out 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNS_OUT sink_out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* Local bias bypassing and modest output-pole adjustment.
CBP bp vdd 0.2p
CBPC bpc vdd 0.2p
CBNC bnc 0 0.2p
COUT out 0 0.15p

.ends dut
