.subckt dut iref inp inn out
* ---------- bias ----------
* reference diode: 20 uA from the external source
XMN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* 20 uA mirror feeding a PMOS diode
XMN1 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS mirror feeding a narrow NMOS diode -> cascode bias vbc (~0.75 V)
XMP1 vbc pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN2 vbc vbc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=1 nf=1 m=1
* ---------- first stage ----------
* tail current source, 40 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* NMOS input pair
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 n1 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---------- second stage ----------
* PMOS common-source driver, ~200 uA (10x the load device)
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=10
* cascoded NMOS current sink, 200 uA
XM6 nc vbc ns 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=10
XM7 ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=10
* ---------- Miller compensation with nulling resistor ----------
RZ n1 nz 1.5k
CC nz out 0.6p
* tie the cascode drain to the output
RT nc out 0
.ends dut
