.subckt dut iref inp inn out
* ---- bias: iref (20 uA) mirrored by diode-connected NMOS ----
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=4
* ---- first stage: NMOS diff pair, PMOS mirror load, 40 uA tail ----
XMT  ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=8
XM1  n1 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=5
XM2  n2 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=5
XM3  n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=2
XM4  n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=2
* ---- second stage: PMOS common source, 160 uA NMOS sink ----
XM5  out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=6
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=32
* ---- Miller compensation with nulling resistor ----
RZ   n2 nc 2.4k
CC   nc out 0.5p
.ends dut
