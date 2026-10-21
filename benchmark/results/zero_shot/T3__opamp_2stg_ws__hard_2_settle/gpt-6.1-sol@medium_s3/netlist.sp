.subckt dut iref inp inn out

* Reference-current mirror and wide-swing cascode bias.
RREF iref bn 15k
XNREF bn bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS cascode bias.
RBP1 bn bp 1meg
RBP2 bp 0 4meg

* NMOS input-cascode bias.
RBC1 vdd bc 60k
RBC2 bc 0 540k

* AC bypassing of bias nodes.
CBN bn 0 20p
CBP bp 0 20p
CBC bc 0 20p
CBREF iref 0 20p

* Differential input stage and mirrored tail current.
XNTAIL ntail bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5
XNINM ndm inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XNINP ndp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Input-stage NMOS cascodes.
XNCM nmirror bc ndm 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.15 nf=1 m=1
XNCP nstage bc ndp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.15 nf=1 m=1

* Wide-swing cascoded PMOS current-mirror load.
XPMREF npm nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XPMOUT npo nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XPCREF nmirror bp npm vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XPCOUT nstage bp npo vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1

* Common-source output stage with cascoded mirrored sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=0.5 nf=1 m=1
XNSINK nsink bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=11
XNSC out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=3

* Series-R Miller compensation.
RCOMP nstage ncomp 850
CCOMP ncomp out 750f

.ends dut
