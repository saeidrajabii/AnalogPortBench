* Wide-swing cascode mirrors with long-channel, low-overdrive devices.
* Large parallel multiplicities trade area for DC accuracy and headroom.
* Candidate design: specification compliance requires model-based simulation.

.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference: the input current enters a drain, not a source.
* The resistor provides a 60 mV cascode-gate offset at 20 uA.
RNBIAS iin vb4 3k
RNGATE iin vb3 1
XNREF nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=10000
XNCREF vb4 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=10000

* Mirrored NMOS branch establishes the PMOS reference current.
XNTRANSFER ntransfer vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=10000
XNCTRANSFER vb2 vb3 ntransfer 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=10000

* PMOS reference with a corresponding cascode-gate offset.
RPBIAS vb1 vb2 3k
XPREF pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=100 nf=1 m=30000
XPCREF vb1 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=100 nf=1 m=30000

* Output NMOS cascode current sink.
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=10000
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=10000

* Output PMOS cascode current source.
XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=100 nf=1 m=30000
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=100 nf=1 m=30000

.ends dut
