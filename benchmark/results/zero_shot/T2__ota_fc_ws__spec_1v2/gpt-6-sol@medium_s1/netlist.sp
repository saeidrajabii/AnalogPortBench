.subckt dut iref inp inn out
* A 20 uA reference is converted to a gate bias before being mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.65 nf=1 m=1

* Cascode gate biases.
RPC1 vdd vpc 118k
RPC2 vpc 0 122k
RNC1 vdd vnc 130k
RNC2 vnc 0 110k

* NMOS input pair and mirrored tail current.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.65 nf=1 m=1
XINP dlp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.35 nf=1 m=1
XINN drp inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.35 nf=1 m=1

* Folded branches and PMOS current mirror.
XPL pl nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.6 nf=1 m=1
XPR pr nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.6 nf=1 m=1
XFOLDL nleft vpc pl vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XFOLDR out vpc pr vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.5 nf=1 m=1

* Each upper branch supplies an input transistor and a folded branch.
RDL pl dlp 0.001
RDR pr drp 0.001

* Cascoded NMOS branch sinks.
XNBL sl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.65 nf=1 m=1
XNBR sr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.65 nf=1 m=1
XNCL nleft vnc sl 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.65 nf=1 m=1
XNCR out vnc sr 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.65 nf=1 m=1
.ends dut
