.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Differential-pair tail current: nominally 40 uA.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2

* NMOS cascode-bias generator: nominally 10 uA.
XNBP nb vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
XNBD nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1

* PMOS cascode-bias generator: nominally 10 uA.
XPBD vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
XPBN vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* NMOS differential input pair.
XINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Self-biased PMOS current mirror feeding the folded branches.
XPMR foldp mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPMO foldn mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS folded cascodes.
XPCR mirror vb2 foldp vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XPCO out vb2 foldn vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1

* Matched NMOS branch-current sinks.
XNSR nr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNSO no iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* NMOS output cascodes.
XNCR mirror nb nr 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XNCO out nb no 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1

.ends dut
