.subckt dut iref inp inn out
* 20 uA reference and mirrored bias currents
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
XBIAS p_ref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
XPBIAS p_ref p_ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* Differential input stage; tail current is 40 uA
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XINL x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XINR x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XLOADL x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XLOADR x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.8 nf=1 m=1

* Second gain stage; 80 uA mirrored PMOS load
XOUTP out p_ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XOUTN out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1

* Miller compensation
RCOMP x2 ncomp 1k
CCOMP ncomp out 1.2p
.ends dut
