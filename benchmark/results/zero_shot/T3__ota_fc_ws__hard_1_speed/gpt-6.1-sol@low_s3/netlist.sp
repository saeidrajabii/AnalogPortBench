* Single-stage OTA with mirrored reference bias.
* Candidate sizing; compliance requires verification with the supplied models.
.subckt dut iref inp inn out

* Reference-current mirror: nominal tail current = 140 uA.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=0.7 nf=1 m=1

* NMOS differential input pair.
* The mirror-side input is non-inverting at the single-ended output.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.7 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.7 nf=1 m=1

* PMOS current-mirror active load.
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XLOADOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1

.ends dut
