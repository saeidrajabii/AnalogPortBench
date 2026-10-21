.subckt Bias iref vbn vbp
* 20 uA reference sink and scaled NMOS tail-current mirror
XNREF  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XNTAIL tail  vbn  0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS reference branch and output-stage current-source bias
XNSINK vbp iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XPPREF vbp vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends Bias

.subckt OTA vbn vbp inp inn out
* NMOS differential input pair, 40 uA total tail current
XTAIL tail vbn 0    0    sky130_fd_pr__nfet_01v8_lvt W=20  L=2 nf=1 m=1
XMIN  d1   inn tail 0    sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XMIP  d2   inp tail 0    sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1

* PMOS current-mirror active load
XMPD d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XMPM d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1

* Common-source second gain stage and PMOS current-source load
XMOUT out d2 0   0   sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XMPOS out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1

* Miller compensation
RZ d2 ncomp 3k
CC ncomp out 700f
.ends OTA

.subckt dut iref inp inn out
XBIAS iref vbn vbp Bias
XAMP vbn vbp inp inn out OTA
.ends dut
