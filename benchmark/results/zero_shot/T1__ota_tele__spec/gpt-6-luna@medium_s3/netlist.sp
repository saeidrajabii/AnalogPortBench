.subckt dut iref inp inn out

* 20 uA reference and mirrored NMOS bias currents
XREF   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XTAIL  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XNB    pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XINP   x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XINN   x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPMD   x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPMR   x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* PMOS bias reference and second-stage current sink/source
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XSTAGE xout x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Miller compensation with a series nulling resistor
CCOMP x2 ncomp 1p
RCOMP ncomp out 3k

.ends dut
