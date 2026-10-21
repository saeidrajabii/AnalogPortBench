.subckt dut iref inp inn out
* Reference current and NMOS current mirrors
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.6 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XPBIAS_SINK pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.6 nf=1 m=1
XPCAS_SINK pcb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.6 nf=1 m=1

* PMOS current reference and cascode-bias generators
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XPCAS_BIAS pcb pcb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.6 nf=1 m=1
XNCAS_FEED ncb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XNCAS_BIAS ncb ncb 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.65 L=0.8 nf=1 m=1

* Differential input stage
XINN pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.8 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.8 nf=1 m=1
XLOAD_D pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1.0 nf=1 m=1
XLOAD_M n1 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1.0 nf=1 m=1

* Cascoded output stage
XOUT_N ns n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.8 nf=1 m=1
XOUT_NCAS out ncb ns 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.5 nf=1 m=1
XOUT_P ps pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.6 nf=1 m=1
XOUT_PCAS out pcb ps vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.6 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ n1 comp 3.5k
CC comp out 0.55p
.ends dut
