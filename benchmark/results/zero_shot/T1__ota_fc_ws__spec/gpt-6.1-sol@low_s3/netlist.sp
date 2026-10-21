* SKY130 LVT folded-cascode OTA.
* Candidate sizing; specification compliance requires TT simulation.

.subckt dut iref inp inn out

* Reference-current mirror.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS bias reference: nominally twice the reference current.
XNBP bp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XPBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Wide-swing PMOS cascode bias.
XNPBC vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPPBC vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* Wide-swing NMOS cascode bias.
XPNBC vbn bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XNNBC vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Differential input pair and mirrored tail current.
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XNINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XNINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Folded PMOS current mirror.
XPTOPL foldp mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPTOPR foldn mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPCASL mirror vbp foldp vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPCASR out vbp foldn vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Cascoded NMOS current sinks.
XNSINKL sinkl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNSINKR sinkr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNCASL mirror vbn sinkl 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNCASR out vbn sinkr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

.ends dut
