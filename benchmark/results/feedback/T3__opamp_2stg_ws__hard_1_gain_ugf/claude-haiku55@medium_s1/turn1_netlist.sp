.subckt dut iref inp inn out
* Bias: NMOS diode reference at iref (drain of diode, no current into a source).
* Tail mirror 3x (~60 uA) and output-stage sink mirror 10x (~200 uA).
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
XMout out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=10

* First stage: NMOS differential pair with PMOS diode-connected mirror load.
* inn drives the diode-side device (nd1) and inp drives the output-side device (n1),
* so out follows inp non-inverting in the closed loop.
XM1 nd1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp3 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMp4 n1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Second stage: PMOS common-source driven by n1, NMOS current-sink load (~200 uA).
XMp5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor (1 pF load is supplied by the testbench).
Rz n1 cz 1k
Cc cz out 0.4p
.ends dut
