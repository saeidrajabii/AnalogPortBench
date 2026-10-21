* Candidate SKY130 folded-cascode OTA.
* Performance must be verified against the supplied testbench;
* compliance with the specifications has not been established.

.subckt dut iref inp inn out

* Reference-current mirror and input-pair tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1

* PMOS bias: nominal 10 uA reference and 50 uA per branch.
XBIASN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential input pair.
XINP foldp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XINN foldn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Folded-branch current sources.
XPSP foldp pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XPSN foldn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1

* PMOS folded cascodes.
XPCP nc pcb foldp vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XPCN out pcb foldn vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Cascoded NMOS current mirror.
XNDREF nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNCREF nc nc nb 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XNDOUT ns nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNCOUT out nc ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Folded-cascode gate bias: 0.95 V nominal.
RPC_TOP vdd pcb 850k
RPC_BOT pcb 0 950k
CPCB pcb 0 2p

.ends dut
