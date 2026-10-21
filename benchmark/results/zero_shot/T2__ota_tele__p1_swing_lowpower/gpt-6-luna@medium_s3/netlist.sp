.subckt dut iref inp inn out
* Reference and mirrored NMOS bias currents
X_NREF vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
X_NTAIL tail vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
X_NBIAS vbp vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
X_NOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* NMOS differential pair; PMOS current-mirror load
X_NINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
X_NINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
X_PDIFF1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.8 nf=1 m=1
X_PDIFF2 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.8 nf=1 m=1

* PMOS load bias and second-stage current-source load
X_PBIAS vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.8 nf=1 m=1
X_POUT out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.8 nf=1 m=1

* Miller compensation with series nulling resistor
RZ n1 ncomp 2k
CC ncomp out 1p
.ends dut
