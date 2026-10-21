.subckt bias_lv iref vb4 vbp
* Self-biased low-voltage cascode reference.
* vb3 is the iref node itself; vb4 = vb3 - Iref*R1
R1    iref vb4 12k
XMRC  nb   iref nb_s 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
XMR   nb_s vb4  0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* Short nb to vb4 so the 20 uA flows R1 -> MRC -> MR
RSH   nb vb4 1m
* PMOS cascode bias (~5 uA)
XMBN  vbp  vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMBP  vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1 nf=1 m=1
.ends bias_lv

.subckt opamp_tc vb3 vb4 vbp vm vout vp
* Stage 1: NMOS pair with low-voltage cascoded PMOS mirror load
XM1   n08 vp  n10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2   n9  vm  n10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMT   n10 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
XM3   x3  n9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8.2 L=0.4 nf=1 m=1
XM3C  n9  vbp x3  vdd sky130_fd_pr__pfet_01v8_lvt W=8.2 L=0.4 nf=1 m=1
XM4   x4  n9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8.2 L=0.4 nf=1 m=1
XM4C  n08 vbp x4  vdd sky130_fd_pr__pfet_01v8_lvt W=8.2 L=0.4 nf=1 m=1
* Stage 2: PMOS common source with cascoded NMOS sink (~110 uA)
XM5   vout n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.4 nf=1 m=1
XM6C  vout vb3 n6 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=22
XM6   n6   vb4 0  0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=22
* Miller compensation with nulling resistor
RZ    n08 nc 4k
CC    nc vout 0.5p
.ends opamp_tc

.subckt dut iref inp inn out
XB iref vb4 vbp bias_lv
XA iref vb4 vbp inn out inp opamp_tc
.ends dut
