.subckt dut iref inp inn out
* ---------------- Bias generator ----------------
* Reference diode: 20 uA into 4 x (5/0.5)
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4

* PMOS cascode bias vb2: 5 uA replica diode (same density as OTA PMOS cascodes) + 60k level shift
XMPD  ybp  ybp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.5 nf=1 m=1
R2    ybp  vb2  60k
XMNB2 vb2  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* NMOS cascode bias vb3: 5 uA mirrored PMOS source, replica NMOS diode + 52k level shift
XMPB3 vb3  ybp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.5 nf=1 m=1
R3    vb3  xbn  52k
XMND3 xbn  xbn  0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* ---------------- Folded-cascode OTA ----------------
* Tail: 100 uA
XTAIL tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=20
* NMOS input pair, wide/weak inversion, bulk tied to source (no body effect)
XIN1  fl   inp  tail tail sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=8
XIN2  fr   inn  tail tail sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=8
* PMOS folding current sources, self-biased from net1 (~95 uA each)
XPS1  fl   net1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=7
XPS2  fr   net1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=7
* PMOS cascodes (~45 uA each)
XPC1  net1 vb2  fl   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XPC2  out  vb2  fr   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
* NMOS cascodes
XNC1  net1 vb3  sl   0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=9
XNC2  out  vb3  sr   0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=9
* NMOS current sinks: 45 uA each
XNS1  sl   iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=9
XNS2  sr   iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=9
.ends dut
