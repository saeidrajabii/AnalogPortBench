* Low-overdrive, long-channel wide-swing cascode candidate.
* Performance requires verification with the supplied SKY130 TT models.
* All transistor dimensions are in micrometres.

.subckt dut iin out vb1 vb2 vb3 vb4

* Reference NMOS and unloaded NMOS mirror-gate output.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
RNGATE iin vb4 1

* Mirror the reference into a diode-connected PMOS reference.
XMNTRANSFER vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1

* NMOS cascode bias: a higher-Vgs replica driven by a PMOS mirror.
XMPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1
XMNCBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6250 L=100 nf=1 m=1

* PMOS cascode bias: a higher-|Vgs| replica loaded by an NMOS mirror.
XMNPBIAS vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XMPCBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25000 L=100 nf=1 m=1

* Cascoded output current sink.
XMNLOW nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XMNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* Cascoded output current source.
XMPHIGH psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1
XMPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1

.ends dut
