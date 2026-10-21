.subckt dut iref inp inn out
* NMOS reference sink and mirrored tail current
XMREFN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=1 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=1 nf=1 m=1

* PMOS reference branch, biased by a mirror of the reference sink
XMNPMREF vbiasp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=1 nf=1 m=1
XMPREF vbiasp vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
XMNINP x1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMNINN x2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMPLOAD1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
XMPLOAD2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1

* Second stage
XMPOUT out vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14.5 L=1.5 nf=1 m=1
XMNOUT out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Miller compensation with series zero-nulling resistor
RZ x2 xcomp 1k
CCOMP xcomp out 350f
.ends dut
