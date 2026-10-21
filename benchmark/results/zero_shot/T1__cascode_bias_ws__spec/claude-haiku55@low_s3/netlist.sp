.subckt dut iin out vb1 vb2 vb3 vb4
* ---- Bias generation (reference current = 20 uA into iin) ----
* vb4 tracks iin (0 ohm-like tie through 1 mOhm so vb4 is a real node)
Rtie iin vb4 1m
* NMOS reference diode and mirror sinks
XMN4  iin  iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN7  vb1  iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNs  vb2  iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS reference diode (vb1) carries Iref from vdd
XMPpd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS cascode-bias stack: vb2 = vdd - Vsg(vb1 device) - Vsg(diode)
XMPcd0 n_pa vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPcd1 vb2 vb2 n_pa vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS source feeding vb3 (mirror of vb1 device)
XMPs  vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS cascode-bias stack: vb3 = Vgs(diode) + Vgs(bottom device)
XMNcd0 n_na iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNcd1 vb3 vb3 n_na 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- Output stage ----
* NMOS cascode sink to ground
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode source from vdd
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
