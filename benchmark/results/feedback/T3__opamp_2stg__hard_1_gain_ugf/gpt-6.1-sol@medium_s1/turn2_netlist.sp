.subckt dut iref inp inn out

* Reference-current receiver and mirrored bias current.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* Reduced-headroom NMOS cascode-bias generator.
XMPCBIAS ncas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMNCB0 ncb0 ncb0 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNCB1 ncas ncas ncb0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Differential input stage.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMNINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=3 nf=1 m=1
XMNINN pmgate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=3 nf=1 m=1

* PMOS mirror with enlarged cascodes for reduced headroom.
XMPMREF pref pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMPCREF pmgate iref pref vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMPMOUT pout pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMPCOUT n1 iref pout vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Second stage and long-channel PMOS output-current mirror.
XMNOUT n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMNCOUT out ncas n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=7
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=6
XMPOUTA out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1

* Miller compensation with a left-half-plane zero.
RZ n1 ncomp 3.5k
CC ncomp out 800f

.ends dut
