.subckt dut iref inp inn out
* Bias: diode-connected reference driven by iref (ideal 20 uA from vdd)
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail mirror, ratio 2 -> ~40 uA
XMB1 ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* Second-stage sink mirror, ratio 6 -> ~120 uA
XMB2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* Stage 1: NMOS differential pair with PMOS mirror load
* MN1 (inn) drives the diode side, MN2 (inp) drives the output side
XMN1 n_d inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN2 n_o inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP3 n_d n_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP4 n_o n_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Stage 2: PMOS common-source with NMOS current-sink load
XMP5 out n_o vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Miller compensation with nulling resistor
RZ n_o nc 3.5k
CC nc out 500f
.ends dut
