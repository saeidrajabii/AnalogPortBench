.subckt dut iref inp inn out

* Reference-current sensing and mirrored bias currents.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS reference: two mirrored 20-uA sinks.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XNPR1 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
RPCAS pbias pcas 6.5k
XNPR2 pcas iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Level-shifted NMOS cascode bias.
XPNBIAS ncas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
RNCAS ncas nrep 20k
XNREP nrep nrep 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* NMOS differential input stage, nominal 80-uA tail current.
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=4
XNINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.5 nf=1 m=1
XNINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.5 nf=1 m=1

* Wide-swing cascoded PMOS active mirror.
XPMREF pmref mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XPCREF mirror pcas pmref vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XPMOUT pmout mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XPCOUT stage1 pcas pmout vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Cascoded common-source output stage.
XPOUT pout_internal stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=0.5 nf=1 m=1
XPOUTC out pcas pout_internal vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=0.5 nf=1 m=1
XNOUTC out ncas nout_internal 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=8
XNOUT nout_internal iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=8

* Miller compensation with a series zero-setting resistor.
RCOMP stage1 comp 1.2k
CCOMP comp out 750f

.ends dut
