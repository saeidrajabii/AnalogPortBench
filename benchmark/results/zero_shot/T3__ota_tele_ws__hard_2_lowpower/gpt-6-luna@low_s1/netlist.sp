.subckt dut iref inp inn out
* NMOS reference and mirrored sink currents
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMSINK nref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS mirror-load reference branch and output branch
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPOUT out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Differential input pair
XMNINP nref inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMNINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
.ends dut
