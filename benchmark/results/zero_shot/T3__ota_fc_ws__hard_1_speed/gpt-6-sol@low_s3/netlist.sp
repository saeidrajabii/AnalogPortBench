.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Generate the PMOS bias and the NMOS cascode bias.
XBN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XBC nb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
RBC nb iref 12k

* Differential pair and mirrored tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XINP dl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XINN dr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1

* Telescopic NMOS cascodes.
XNL pcl nb dl 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XNR out nb dr 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPLU ptop ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XPLL pcl pcl ptop vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XPRU prtop ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XPRL out pcl prtop vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=1
.ends dut
