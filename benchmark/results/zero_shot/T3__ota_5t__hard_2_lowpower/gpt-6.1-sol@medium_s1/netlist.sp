* Single-stage OTA with mirrored reference bias.
* SKY130 dimensions are in micrometres.
.subckt dut iref inp inn out

* 20 uA reference branch; nominal 10 uA tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1

* NMOS differential pair.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=144 L=1.2 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=144 L=1.2 nf=1 m=1

* PMOS current-mirror load.
XPREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XPOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1

.ends dut
