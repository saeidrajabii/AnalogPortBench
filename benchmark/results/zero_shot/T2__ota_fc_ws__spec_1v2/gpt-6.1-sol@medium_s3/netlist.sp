* Low-voltage folded-cascode port candidate.
* Performance must be verified using the target models and testbench.

.subckt dut iref inp inn out

* Reference current mirror and NMOS cascode bias.
RNB iref nb 7.5k
XNREF nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
CNB nb 0 2p
CNC iref 0 2p

* PMOS reference and level-shifted folded-cascode bias.
XPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
RPB pb pcb 12.5k
XNPBIAS pcb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
CPB pb vdd 2p
CPCB pcb vdd 2p

* NMOS differential pair and mirrored tail current.
XNTAIL tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=4
XNINP fold_l inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XNINN fold_r inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Upper current sources.
XPTOPL fold_l pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=4
XPTOPR fold_r pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=4

* PMOS folding devices.
XPFOLDL mirror pcb fold_l vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XPFOLDR out pcb fold_r vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Wide-swing cascoded NMOS current mirror.
XNCASL mirror iref sink_l 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XNCASR out iref sink_r 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XNML sink_l mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XNMR sink_r mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* Additional dominant-pole capacitance; external 1 pF remains unchanged.
CDOM out 0 0.5p

.ends dut
