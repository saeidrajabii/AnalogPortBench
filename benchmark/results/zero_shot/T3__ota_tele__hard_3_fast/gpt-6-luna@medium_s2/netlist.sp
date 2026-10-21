.subckt dut iref inp inn out
* NMOS reference and mirrored bias currents
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XMBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.2 nf=1 m=1

* PMOS bias reference and mirrored second-stage load
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1 nf=1 m=1
XMPL out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* NMOS differential input pair; PMOS mirror load
XM1 x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XM2 x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMP1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Common-source output stage
XMOUT out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=500 L=0.5 nf=1 m=1

* Miller compensation with a series zero-nulling resistor
RCOMP x2 ncomp 500
CCOMP ncomp out 500f
.ends dut
