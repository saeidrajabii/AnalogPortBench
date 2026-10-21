.subckt dut iref inp inn out
* Bias: 20 uA reference diode (iref), mirrored to tail (3x = 60 uA) and output sink (6x = 120 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=1 nf=1 m=1
* Stage 1: NMOS differential pair (L=2 for gain) with PMOS mirror load
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=2 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=2 nf=1 m=1
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=2 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=2 nf=1 m=1
* Stage 2: PMOS common-source (gm ~1 mS) with NMOS cascode current sink for gain boost
XM6 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=86 L=1 nf=1 m=1
XM7 x iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1 nf=1 m=1
XM8 out vcn x 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1 nf=1 m=1
* Cascode gate bias: 1.2 V x 100k/(50k+100k) = 0.8 V
Rv1 vdd vcn 50k
Rv2 vcn 0 100k
* Miller compensation with nulling resistor
Rz n2 nz 2.7k
Cc nz out 0.6p
.ends dut
