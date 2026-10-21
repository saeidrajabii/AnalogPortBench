.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 40 uA tail,
* and 160 uA nominal second-stage sink current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=2
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=8

* NMOS differential input stage with PMOS current-mirror load.
* The second-stage inversion makes inp the non-inverting input.
XMIN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
XMIP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
XPLREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
XPLMIR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1

* Common-source output stage.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 4.7k
CCOMP ncomp out 1.5p

.ends dut
