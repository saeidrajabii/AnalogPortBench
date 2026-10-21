.subckt bias_gen iref vbN vbP
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XNPM vbP iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XPPREF vbP vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
.ends bias_gen

.subckt amp_core vbN vbP inp inn out
* DC-limiting input resistors; capacitors preserve the signal path.
RINP inp pin_int 10Meg
CINP inp pin_int 10n
RINN inn nin_int 10Meg
CINN inn nin_int 10n

* NMOS input pair with PMOS current-mirror load
XMNINN nd nin_int ns 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMNINP n1 pin_int ns 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMTAIL ns vbN 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
XMPLOAD1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMPLOAD2 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* Second gain stage and Miller compensation
XMPOUT out vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=1
XMNOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
RZ n1 ncomp 1k
CC ncomp out 800f
.ends amp_core

.subckt dut iref inp inn out
XBIAS iref vbN vbP bias_gen
XAMP vbN vbP inp inn out amp_core
.ends dut
