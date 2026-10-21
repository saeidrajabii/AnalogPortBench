.subckt dut iref inp inn out
* Bias: NMOS diode reference at iref. Tail mirror 4x (~80 uA), output sink mirror 12x (~240 uA).
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMout out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=12

* First stage: NMOS pair (L=1 for higher output resistance) with PMOS diode mirror load (L=2).
* inn drives the diode side (nd1), inp drives the output side (n1), so out follows inp.
XM1 nd1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMp3 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XMp4 n1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1

* Second stage: PMOS common source (gm2 about 2.5 mS at ~240 uA) with NMOS current sink.
XMp5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* Miller compensation with nulling resistor.
* Cc = 0.3 pF gives UGF near 130 MHz. Rz is about (1 + CL/Cc)/gm2 to cancel the second pole.
Rz n1 cz 1.6k
Cc cz out 0.3p
.ends dut
