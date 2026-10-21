.subckt dut iref inp inn out
* Bias: iref diode MB1 (20 uA); MB6/MB8 mirror 10 uA
MB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
MB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
MB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
MB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
MB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
MB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
MB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
MB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* Tail: 40 uA (2 x mirror of MB1)
MT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
* Input pair
M1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
M2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS cascodes
M3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
M4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS folding cascodes and sources
M5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
M6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
M7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
M8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
