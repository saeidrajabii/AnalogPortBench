.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS reference: self-biased wide-swing cascode ----------
* Iref enters iin, then drops I*R (~0.16 V) to vb4 = gate of the bottom device.
* Current flows into the cascode drain, never into a source.
R0     iin vb3 1
R1     vb3 vb4 8k
XMNc1  vb4 vb3 nx1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMNb1  nx1 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8

* ---------- NMOS cascode copy of Iref that feeds the PMOS reference ----------
XMNc2  vb2 vb3 nx2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMNb2  nx2 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8

* ---------- PMOS reference: self-biased wide-swing cascode ----------
R2     vb1 vb2 8k
XMPc1  vb1 vb2 px1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=24
XMPb1  px1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=24

* ---------- Output: NMOS cascode sink and PMOS cascode source ----------
XMNb0  nsrc vb4 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMNc0  out  vb3 nsrc 0  sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMPb0  psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=24
XMPc0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=24
.ends dut
