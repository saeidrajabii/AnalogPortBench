.subckt dut iref inp inn out

* Reference-current receiver and mirrored bias branch.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* Reduced-headroom output-cascode bias.
XMPCBIAS ncas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMNCB0 ncb0 ncb0 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMNCB1 ncas ncas ncb0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Differential input stage.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.5 nf=1 m=1
XMNINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=4 nf=1 m=1
XMNINN pmgate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=4 nf=1 m=1

* Low-voltage cascoded PMOS mirror.
XMPMREF pref pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.75 nf=1 m=1
XMPCREF pmgate iref pref vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMPMOUT pout pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.75 nf=1 m=1
XMPCOUT n1 iref pout vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* Second stage with reduced internal-node capacitance.
XMNOUT n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XMNCOUT out ncas n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=7
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=6
XMPOUTA out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1

* Series-resistor Miller compensation.
RZ n1 ncomp 3k
CC ncomp out 850f

.ends dut
