* DC-oriented, long-channel wide-swing cascode mirror.
* Candidate sizing; specification compliance requires model-based simulation.
.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and unloaded reference-gate output.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=1000
RNB iin vb4 1k

* Mirror the reference current into a diode-connected PMOS.
XNP vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=1000
XPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=1000 nf=1 m=1000

* Higher-VGS NMOS diode generates the NMOS cascode bias.
XPBN vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=1000 nf=1 m=1000
XNBN vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=111.111111 L=1000 nf=1 m=1000

* Higher-|VGS| PMOS diode generates the PMOS cascode bias.
XNBP vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=1000
XPBP vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=444.444444 L=1000 nf=1 m=1000

* Output NMOS cascode current sink.
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=1000
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=1000

* Output PMOS cascode current source.
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=1000 nf=1 m=1000
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=1000 nf=1 m=1000

.ends dut
