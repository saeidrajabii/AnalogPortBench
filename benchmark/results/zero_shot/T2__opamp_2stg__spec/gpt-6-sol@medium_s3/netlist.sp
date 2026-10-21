.subckt dut iref inp inn out
* The reference current enters the drain of a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* Biases for the output-stage cascodes.
RPC vdd pc 30k
XPCB pc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
RNC vdd nc 22k
XNCB nc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* NMOS differential input stage and PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPMIR first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Cascoded, inverting second stage.
XPDRV pmid first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=4
XPCAS out pc pmid vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=4
XNSINK nmid iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=5
XNCAS out nc nmid 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=5

* Series-nulling-resistor Miller compensation.
RZ first comp 1.1k
CC comp out 1.2p
.ends dut
