.subckt dut iref inp inn out
* ---- bias: iref sunk by NMOS diode (5 units) ----
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
* 4 uA into PMOS bias diode
XMNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* ---- first stage: PMOS diff pair, NMOS mirror load ----
XMTAIL tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=2
XMIN1 nd inn tail tail sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMIN2 o1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMLD1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XMLD2 o1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
* ---- second stage: NMOS common source (4x load), PMOS source (4 units -> 16 uA) ----
XMCS out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=4
XMSRC out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=4
* ---- Miller compensation with nulling resistor ----
RZ o1 nz 12k
CC nz out 0.4p
.ends dut
