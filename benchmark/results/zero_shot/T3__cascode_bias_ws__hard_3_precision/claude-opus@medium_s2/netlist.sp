* Wide-swing cascode bias + cascode source/sink, SKY130 LVT, VDD = 1.2 V
.subckt dut iin out vb1 vb2 vb3 vb4

* ---- NMOS wide-swing reference: Iin goes into a drain (not a source) ----
* iin node = gate of bottom device (vb4), cascode gate = vb3
XMN9  iin  vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12
XMN10 nref iin 0    0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12
R4    iin  vb4 1

* ---- vb3 generator: PMOS mirror -> resistor + NMOS diode ----
XMP5  vb3 ny vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=40
R3    vb3 nx 10k
XMN8  nx  nx 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12

* ---- vb2 generator: PMOS diode + resistor <- NMOS mirror ----
XMP4  ny  ny  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=40
R2    ny  vb2 9k
XMNA  vb2 vb4 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12

* ---- PMOS wide-swing reference, fed by a cascoded NMOS copy of Iref ----
XMP3  np1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=40
XMP2  vb1 vb2 np1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=40
XMN7  vb1 vb3 nc1 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12
XMN6  nc1 vb4 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12

* ---- Output: NMOS cascode sink and PMOS cascode source meeting at out ----
XMN0  nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12
XMN2  out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=12
XMP1  psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=40
XMP0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=40
.ends dut
