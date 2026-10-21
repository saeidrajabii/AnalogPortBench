.subckt dut in out
* ---- core mirror (weak inversion, Vds of both held at ~90 mV) ----
XM1  d1  in  0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=30
XM0  d0  in  0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=30
* reference-side cascode: sets V(d1) = vb - Vgs ~ 90 mV
XMC1 in  vb  d1  0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=10
* output-side regulated cascode (gate driven by error amplifier)
XMC0 out o2  d0  0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=2

* ---- bias: 4 uA copy of Iref ----
XM2  pb  in  0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=6
XMPB pb  pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* cascode gate bias: Vgs(replica) + 4uA*22.5k = Vgs + 90 mV
XMPV vb  pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB  vb  vb  nr  0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
R1   nr  0   22.5k

* ---- error amplifier: PMOS-input OTA + CS second stage ----
XMPT tl  pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
XPA  a1  d0  tl  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XPB  o1  d1  tl  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNA  a1  a1  0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNB  o1  a1  0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XCS  o2  o1  0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XPL  o2  pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
C1   o2  o1  0.5p
.ends dut
