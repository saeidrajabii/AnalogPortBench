.subckt dut iref inp inn out

* Reference-current sink and NMOS bias mirrors
XMNREF vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNTAIL ntail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNBIAS nbias vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNPMREF npref vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNOUT out vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* PMOS reference branch and current mirrors
XMPREF npref npref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPLOAD n1 npref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPOUT out npref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XMNINP n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNINN n2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPDIODE n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPMIRROR n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Miller compensation
RZ n2 ncomp 2k
CCOMP ncomp out 1p

.ends dut
