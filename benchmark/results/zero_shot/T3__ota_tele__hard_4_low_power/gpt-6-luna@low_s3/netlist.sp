.subckt dut iref inp inn out
* Reference-current mirror and bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XTAIL nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XTAILM nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XIN1 nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XIN2 out inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XTAILDEV ntail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XLOAD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XLOAD2 out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Second gain stage and output driver
XDRV out nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XPU out nbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1
.ends dut
