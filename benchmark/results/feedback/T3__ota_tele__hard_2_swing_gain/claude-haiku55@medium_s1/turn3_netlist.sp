.subckt dut iref inp inn out
* Bias: reference diode (20 uA from iref)
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Bias: PMOS diode vbt (about 10 uA), sunk by NMOS mirror (ratio 0.5)
XMPT  vbt vbt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMBT  vbt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* PMOS tail current source (about 20 uA, ratio 2 to XMPT)
XMTP  tail vbt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS input pair (about 10 uA each)
XM1   d1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2   n1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* NMOS current-mirror load (1:1)
XM3   d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4   n1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Second stage: NMOS common-source with PMOS current-source load (about 30 uA)
XM6   out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XM7   out vbt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
RZ    n1 cc 3k
CC    cc out 1p
.ends dut
