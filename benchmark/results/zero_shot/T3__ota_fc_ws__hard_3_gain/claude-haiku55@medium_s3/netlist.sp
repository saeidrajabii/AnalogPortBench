.subckt dut iref inp inn out
* ---------------- bias generation (20 uA reference) ----------------
* iref is the gate/drain of the reference diode (not a source), so the
* reference current is mirrored.
XMref  iref iref 0 0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* vb1: PMOS-mirror gate, 20 uA
XMb1n  vb1 iref 0 0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMb1p  vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* vb2: PMOS cascode gate (~0.2 V), 10 uA
XMb2n  vb2 iref 0 0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMb2p  vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1 nf=1 m=1
* vb3: NMOS cascode gate (~0.9 V), 10 uA
XMb3p  vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMb3n  vb3 vb3 0 0     sky130_fd_pr__nfet_01v8_lvt W=0.5 L=1 nf=1 m=1
* vtl: tail gate (~0.44 V), low-Vdsat tail for the NMOS input pair, 10 uA
XMbtp  vtl vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMbtn  vtl vtl 0 0     sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* ---------------- OTA: NMOS-input folded cascode ----------------
* Tail (no tail cascode: CM = 0.6 V leaves no room for a stacked tail)
XMt    net08 vtl 0 0   sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=1 m=1
* Input pair (inp non-inverting, inn inverting)
XM2    net010 inp net08 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XM1    net016 inn net08 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
* Folding PMOS current sources (gate self-biased at net1)
XMp0   net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMp2   net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
* PMOS cascodes
XMp4   net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMp5   out vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
* NMOS cascode sinks (bottom current sinks gate = iref)
XMn6   net1 vb3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMn7   net018 iref 0 0  sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMn9   out vb3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMn8   net017 iref 0 0  sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
