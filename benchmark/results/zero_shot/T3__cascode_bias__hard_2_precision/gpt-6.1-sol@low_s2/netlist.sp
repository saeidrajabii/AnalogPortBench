* Wide-swing cascode mirror.
* Candidate sizing; specification compliance requires TT model simulation.
.global vdd

.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference cascode: reference current enters a drain.
RNI iin vb4 1m
XNREF nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNCREF iin vb3 nref nref sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* PMOS reference cascode, driven by a mirrored NMOS sink.
XPREF pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1
XPCREF vb1 vb2 pref pref sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1
XNTRANSFER nxfer vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNCTRANSFER vb1 vb3 nxfer nxfer sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* Reduced-width diode devices establish wide-swing cascode gates.
XPNAUX vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1
XNBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=50000 L=1000 nf=1 m=1

XPBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150000 L=1000 nf=1 m=1
XNPAUX vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* Output cascode current sink and source.
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNCOUT out vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1
XPCOUT out vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1

.ends dut
