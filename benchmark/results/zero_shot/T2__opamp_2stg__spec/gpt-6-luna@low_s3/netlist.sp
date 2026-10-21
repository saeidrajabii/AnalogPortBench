.subckt Bias iref vbN vbP
* Reference NMOS: the reference current enters its drain, not its source.
XMNREF vbN vbN 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
* NMOS mirror branch establishes the PMOS mirror bias.
XMNBIAS vbP vbN 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XMPBIAS vbP vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.6 nf=1 m=1
.ends Bias

.subckt Opamp vbN vbP inp inn out
* Differential input pair and PMOS current-mirror load.
XMNTAIL tail vbN 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMNI nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XMNR nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XMPDIODE nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XMPMIRROR nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1

* Second gain stage and output bias.
XMNS2 out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.6 nf=1 m=1
XMPS2 out vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.6 nf=1 m=2

* Miller compensation.
RCC nright ncomp 3k
CCC ncomp out 500f
.ends Opamp

.subckt dut iref inp inn out
XI_BIAS iref vbN vbP Bias
XI_AMP vbN vbP inp inn out Opamp
.ends dut
