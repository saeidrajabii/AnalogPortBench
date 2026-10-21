.subckt dut iin out vb1 vb2 vb3 vb4
* ---- Bias generator (NMOS reference stack, mirrors the source topology) ----
* Reference current enters iin and flows through the diode-connected stack to ground.
R1 iin vb3 1
XMb1 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMb2 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias-side PMOS diode stack, sunk by an NMOS replica of the output sink
XMb3 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMb4 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMb5 vb2 vb3 nbn 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMb6 nbn vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- Output NMOS cascode current sink (to ground) ----
XMn2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMn0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- Output PMOS cascode current source (from vdd) ----
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
