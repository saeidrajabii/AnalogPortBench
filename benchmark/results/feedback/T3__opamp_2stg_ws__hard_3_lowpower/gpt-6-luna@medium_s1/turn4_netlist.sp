.subckt Bias iref vbn vbp
* Reference NMOS and scaled NMOS bias mirrors
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XTAIL  vbn  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2.5 L=2 nf=1 m=1
XNBP   vbp  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=1.25 L=2 nf=1 m=1
* PMOS bias reference and mirror
XMPREF vbp  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
.ends Bias

.subckt OTA vbn vbp inp inn out
* Input isolation resistors
RINP inp inp_g 1k
RINN inn inn_g 1k

* NMOS differential input pair
XTAIL tail vbn 0    0    sky130_fd_pr__nfet_01v8_lvt W=2.5 L=2 nf=1 m=1
XMNI  d1   inn_g tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNP  d2   inp_g tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS current-mirror load
XMPD d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPM d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

* Second gain stage with PMOS current-source load
XMOUT out d2 0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPOS out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1

* Miller compensation
RZ d2 ncomp 3k
CC ncomp out 500f
.ends OTA

.subckt dut iref inp inn out
XBIAS iref vbn vbp Bias
XAMP vbn vbp inp inn out OTA
.ends dut
