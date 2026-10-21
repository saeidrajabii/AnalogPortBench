.subckt dut iref inp inn out
* NMOS reference sink and scaled current sinks
XMNREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMNPR   p_ref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMNT    nsrc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* PMOS reference mirror
XMPREF p_ref p_ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Differential input pair with PMOS current-mirror load
XMNINL nl inn nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMNINR n1 inp nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPD   nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPM   n1 nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Second gain stage
XMPS2 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Miller compensation
RZ n1 ncomp 1.2k
CC ncomp out 1.2p
.ends dut
