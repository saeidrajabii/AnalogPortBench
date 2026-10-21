.subckt dut iref inp inn out

* Reference-current sensing and bias mirrors
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMP vbiasp vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB vbiasp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* NMOS differential pair and PMOS mirror load
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
XM1 nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XM2 nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* Second gain stage: PMOS common-source device with NMOS current sink
XMS out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
XMO out nright vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=3

* Miller compensation
CC out nright 2p

.ends dut
