.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes the NMOS mirror gate voltage.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
RNGATE iin vb4 1

* PMOS mirror bias. The diode carries two nominal 20 uA branches.
XNPBIAS vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
RPBIAS vb1 vb2 6k
XNPCASBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Generate the NMOS cascode gate voltage one resistor drop above
* a separately biased NMOS diode.
XPCASBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
RNCAS vb3 ncas_ref 6k
XNCASREF ncas_ref ncas_ref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Output current sink and source.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
.ends dut
