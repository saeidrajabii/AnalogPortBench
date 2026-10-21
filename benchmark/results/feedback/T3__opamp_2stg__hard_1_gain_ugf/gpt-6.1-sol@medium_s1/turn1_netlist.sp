* SKY130 1.2 V two-stage amplifier with low-voltage cascode loads.
* Candidate sizing; specifications require verification with the testbench.
* All transistor dimensions are in micrometres.

.subckt dut iref inp inn out

* Reference-current receiver and NMOS bias mirror.
* The external reference enters a diode-connected transistor drain.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS reference and mirrored cascode-bias branch.
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMPCBIAS ncas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMNCB0 ncb0 ncb0 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNCB1 ncas ncas ncb0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Approximately 50 uA differential-pair tail current.
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* NMOS differential input pair.
XMNINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=2 nf=1 m=1
XMNINN pmgate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=2 nf=1 m=1

* Low-voltage cascoded PMOS mirror load.
XMPMREF pref pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPCREF pmgate iref pref vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPMOUT pout pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPCOUT n1 iref pout vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* Common-source second stage with cascoded NMOS pull-down.
XMNOUT n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMNCOUT out ncas n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=6
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=6

* Series-resistor Miller compensation.
RZ n1 ncomp 2k
CC ncomp out 750f

.ends dut
