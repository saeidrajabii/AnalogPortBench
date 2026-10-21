.subckt dut iref inp inn out
* ---- bias: iref sunk by NMOS diode (5 unit devices, W=4 L=1 each) ----
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
* ---- first stage: NMOS diff pair, PMOS mirror load ----
* tail: 2 units -> ~8 uA
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* diode side driven by inn, output side driven by inp (stage 2 inverts again)
XMIN1 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMIN2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMLD1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMLD2 o1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* ---- second stage: PMOS common source (5x load unit), NMOS sink (5 units -> ~20 uA) ----
XMCS out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=5
XMSNK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
* ---- Miller compensation with nulling resistor ----
RZ o1 nz 7k
CC nz out 0.5p
.ends dut
