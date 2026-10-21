.subckt dut iref inp inn out
* NMOS reference and mirrored tail current
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 m=1

* PMOS bias reference, sunk by an NMOS mirror
XNBP vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Differential input pair and PMOS current-mirror load
XMN_INN x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMN_INP x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMP_LOAD_REF x1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP_LOAD_MIRROR x2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Second gain stage
XMN_OUT out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP_OUT out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Miller compensation
RCOMP x2 ncomp 1k
CCOMP ncomp out 1.2p
.ends dut
