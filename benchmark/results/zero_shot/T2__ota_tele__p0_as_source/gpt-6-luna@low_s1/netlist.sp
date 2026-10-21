.subckt dut iref inp inn out

* Reference-current mirror and tail-current bias
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMTAIL tailb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBP nbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS bias reference and mirrored second-stage load
XMPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XM1 nleft inp tailb 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM2 nright inn tailb 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XM2ND out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
CCOMP nright out 2p
.ends dut
