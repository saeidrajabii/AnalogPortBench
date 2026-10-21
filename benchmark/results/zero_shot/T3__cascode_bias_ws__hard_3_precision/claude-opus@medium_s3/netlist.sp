.subckt dut iin out vb1 vb2 vb3 vb4
* ---------------- NMOS wide-swing reference (fed directly by Iin) ----------
* Iin -> node iin (= vb3, cascode gate) -> Rn -> vb4 (cascode drain = bottom gate)
* Vds(bottom) is about I*Rn/n, roughly 0.13 V. No feedback loop, so no start-up issue.
Rt3   iin vb3 1
Rn    iin vb4 9k
XMNC  vb4 vb3 nr  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMNB  nr  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20

* ---------------- NMOS cascode copy that feeds the PMOS reference ---------
XMNC2 vb2 vb3 nc  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMNB2 nc  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20

* ---------------- PMOS wide-swing reference --------------------------------
* vdd -> MPB -> MPC -> vb1 (cascode drain = bottom gate) -> Rp -> vb2 (cascode gate)
Rp    vb1 vb2 9k
XMPC  vb1 vb2 pr  vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=40
XMPB  pr  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=40

* ---------------- Output cascode sink / source ------------------------------
XMN0  nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMN2  out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMP1  psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=40
XMP0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=40
.ends dut
