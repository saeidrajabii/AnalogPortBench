.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS reference: wide-swing (self-biased) cascode ----------
* Iref flows into the cascode drain; the bottom gate (vb4) is tied to that drain.
Rtie iin vb4 1
XN1 nx1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=8
XN2 iin vb3 nx1 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=12

* ---------- vb3 generator: replica NMOS cascode over a resistor ----------
* The NMOS cascode sources sit at Iref*R1 = 0.13 V.
XP5 p5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=15
XP6 vb3 vb2 p5 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=15
XN6 vb3 vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=12
R1 nr 0 6.5k

* ---------- PMOS reference: wide-swing cascode fed by an NMOS cascode copy ----------
XN3 nx3 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=8
XN4 vb1 vb3 nx3 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=12
XP2 vb1 vb2 py1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=15
XP1 py1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=15

* ---------- vb2 generator: replica PMOS cascode under a resistor ----------
* The PMOS cascode sources sit at VDD - Iref*R2 = 1.07 V.
XN7 nx7 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=8
XN8 vb2 vb3 nx7 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=12
XP8 vb2 vb2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=15
R2 vdd pr 6.5k

* ---------- Output: NMOS cascode sink and PMOS cascode source ----------
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=8
XN9 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=12
XP0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=15
XP9 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=15
.ends dut
