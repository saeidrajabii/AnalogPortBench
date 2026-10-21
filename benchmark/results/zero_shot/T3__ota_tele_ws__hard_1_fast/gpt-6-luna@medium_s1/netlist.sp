.subckt dut iref inp inn out
* PMOS reference and mirrored bias current
XMPREF iref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XMPCOPY nbias iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1

* NMOS current reference and differential-pair tail
XMNBIAS nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNTAIL ntail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1

* Differential pair with PMOS current-mirror load
XMNINL nl inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNINR nr inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPLOADR out nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* Cascode device in the output branch
XMNCAS out vcas nr 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
RVCAS1 vdd vcas 1meg
RVCAS2 vcas 0 3meg
.ends dut
