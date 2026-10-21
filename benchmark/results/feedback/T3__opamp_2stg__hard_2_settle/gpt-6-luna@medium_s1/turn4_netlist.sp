.subckt bias_gen iref vbN vbP
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XNBIAS vbN iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XNPC vbP iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XPPC vbP vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
.ends bias_gen

.subckt amp_core vbN vbP inp inn out
XMNINN nd inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2 nf=1 m=1
XMNINP n1 inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2 nf=1 m=1
XMTAIL ns vbN 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPLOAD1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPLOAD2 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

XMPOUT out vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
RZ n1 ncomp 1k
CC ncomp out 800f
.ends amp_core

.subckt dut iref inp inn out
XBIAS iref vbN vbP bias_gen
XAMP vbN vbP inp inn out amp_core
.ends dut
