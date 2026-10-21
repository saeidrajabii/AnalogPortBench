.subckt dut iref inp inn out
* ---- Bias generation (20 uA reference, mirrored) ----
* Reference: diode-connected NMOS, current drawn from iref drain
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 2x reference (40 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Mirror sink that feeds the PMOS diode stack (20 uA)
XMsink n2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS diode stack: n1 = load gate bias, n2 = PMOS cascode gate bias
XMpd1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMpd2 n2 n2 n1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS source that feeds the NMOS diode stack (20 uA)
XMpnb vbnc n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS diode stack: vbnc = NMOS cascode gate bias (about 2 Vgs)
XMnd1 vbnc vbnc vbncb 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMnd2 vbncb vbncb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- Telescopic core ----
* Input pair (20 uA per side)
XM1 p1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 y2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS cascodes
XMC1 pout vbnc p1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMC2 out vbnc y2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascodes (gate n2)
XMPC1 pout n2 x1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPC2 out n2 x2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS loads (gate n1)
XMPL1 x1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPL2 x2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
