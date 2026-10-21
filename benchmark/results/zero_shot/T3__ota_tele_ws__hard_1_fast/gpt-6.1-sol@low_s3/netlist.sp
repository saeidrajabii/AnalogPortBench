* Two-stage OTA with a mirrored reference and series-R Miller compensation.
* Candidate sizing; performance requires verification with the supplied models.

.subckt dut iref inp inn out

* Reference-current sensing and NMOS bias.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=26.6667 L=0.5 nf=1 m=1

* Generate a 10-uA PMOS mirror reference.
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.3333 L=0.5 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1

* Nominal 70-uA input-stage tail current.
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=280 L=0.7 nf=1 m=1

* PMOS differential input pair.
* First-stage inversion followed by output-stage inversion gives
* non-inverting inp and inverting inn.
XPI1 mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XPI2 stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1

* NMOS current-mirror load.
XNL1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XNL2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1

* Common-source output stage with nominal 120-uA mirrored sink.
XPO out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=0.5 nf=1 m=1
XNO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 m=1

* Miller compensation and zero-control resistor.
RZ stage1 comp 500
CC comp out 0.9p

.ends dut
