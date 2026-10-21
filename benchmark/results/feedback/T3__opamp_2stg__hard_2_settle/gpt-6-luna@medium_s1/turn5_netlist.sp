.subckt bias_gen iref vbP
* Reference NMOS and matched sink establish the PMOS bias.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XNSINK vbP iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XPPREF vbP vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1
.ends bias_gen

.subckt amp_core iref vbP inp inn out
* Differential input pair and PMOS current-mirror load.
XMNINP nd inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMNINN n1 inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XMPLOAD1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=2 nf=1 m=1
XMPLOAD2 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=2 nf=1 m=1

* Class-A second stage.
XMP2 out vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1
XMN2 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* Miller compensation with a series nulling resistor.
RZ n1 ncomp 1.5k
CC ncomp out 500f
.ends amp_core

.subckt dut iref inp inn out
XBIAS iref vbP bias_gen
XAMP iref vbP inp inn out amp_core
.ends dut
