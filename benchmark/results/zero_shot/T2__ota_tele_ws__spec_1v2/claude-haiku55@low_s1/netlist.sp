.subckt dut iref inp inn out
* Bias generation
* NMOS reference: iref (20 uA) is injected into the diode-connected drain
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail mirror, 5x iref, about 100 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS cascode gate bias: two stacked diodes, about 0.9 V, fed by a 200k resistor
XMB1 vbnc vbnc midb 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB2 midb midb 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
Rbn vdd vbnc 200k

* PMOS load gate bias: diode-connected PMOS, about vdd - 0.6 V, fed by a 200k resistor
XMBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
Rbp vbp 0 200k

* Signal path: NMOS-input telescopic stage with a PMOS cascode active load
* Input pair
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* NMOS cascodes
XMNC1 y1 vbnc n1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMNC2 out vbnc n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS cascodes: MPC1 diode-connected, MPC2 forms the output branch
XMPC1 y1 y1 z1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XMPC2 out y1 z2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1

* PMOS loads, about 48 uA each, mirrored from the bias diode
XMPL1 z1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.35 nf=1 m=1
XMPL2 z2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.35 nf=1 m=1
.ends dut
