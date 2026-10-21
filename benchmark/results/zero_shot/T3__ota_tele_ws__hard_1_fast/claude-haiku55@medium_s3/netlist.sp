.subckt dut iref inp inn out
* ---- Bias generation (iref sinks 20 uA into a diode-connected NMOS) ----
* Tail mirror: 6x reference, about 120 uA
XMref  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4  L=0.5 nf=1 m=1
XMtail tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* PMOS bias source for NMOS cascode generator (20 uA)
XMnpb vbp iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=1
XMpb  vbp vbp vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.5 nf=1 m=1
XMpn  vbnc vbp vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.5 nf=1 m=1
XMnc  vbnc vbnc 0 0     sky130_fd_pr__nfet_01v8_lvt W=0.84 L=0.5 nf=1 m=1

* PMOS cascode gate generator (20 uA sunk from diode-connected PMOS)
XMpc  vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XMnpc vbpc iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- Telescopic OTA core ----
* Input pair (tail node: tail)
XMinp n074 inp tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMinn n030 inn tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS cascodes (gate vbnc)
XMcp  n082 vbnc n074 0  sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMcn  out  vbnc n030 0  sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS self-biased mirror load with PMOS cascodes (gate vbpc)
XMp0  n0100 n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMp1  n082  vbpc n0100 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMp2  n097  n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMp3  out   vbpc n097 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
.ends dut
