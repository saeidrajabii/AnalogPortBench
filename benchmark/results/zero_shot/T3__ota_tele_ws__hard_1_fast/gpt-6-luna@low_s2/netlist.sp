.subckt dut iref inp inn out
* PMOS reference and mirrored bias currents
XMPREF iref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS-input differential pair; NMOS current-mirror load
XMPTAIL ntail iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=4
XMPINP nleft inp ntail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPINN nright inn ntail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNLOADL nleft nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNLOADR nright nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Common-source output stage with mirrored PMOS load
XMPLOAD out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=3
XMNOUT out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Miller compensation
CCOMP nright out 2p
.ends dut
