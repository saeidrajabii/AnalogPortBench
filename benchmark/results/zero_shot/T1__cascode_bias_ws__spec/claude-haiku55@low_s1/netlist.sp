.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS bottom-current reference (diode at iin) ----------
* Reference: 20 uA flows drain->source; vb4 is tied to iin through a
* 1 mOhm resistor (about 20 nV drop), so the gate of MN0 tracks iin.
Rtie iin vb4 1m
XMref iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---------- vb1: PMOS bottom gate bias ----------
* NMOS sink mirrors 20 uA out of vb1; diode PMOS sources 20 uA into vb1.
XMs vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMpb vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* ---------- vb2: PMOS cascode gate bias (replica of MP1 + MP0) ----------
XMpx1 xnode vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMpx2 vb2 vb2 xnode vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMt vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---------- vb3: NMOS cascode gate bias (replica of MN0 + MN2) ----------
XMps vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMny1 vb3 vb3 znode 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMny2 znode vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---------- Output branches ----------
* NMOS sink: MN0 (bottom, gate vb4) + MN2 (cascode, gate vb3)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS source: MP1 (bottom, gate vb1) + MP0 (cascode, gate vb2)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
