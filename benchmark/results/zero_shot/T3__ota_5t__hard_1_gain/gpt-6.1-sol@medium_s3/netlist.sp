* Low-voltage, single-stage OTA with PMOS inputs.
* Nominal bias budget: 20 uA reference + 2 uA bias + 30 uA tail.
* Performance requires verification with the supplied SKY130 models.

.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1

* PMOS bias diode and mirrored input-pair tail current.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=450 L=2 nf=1 m=1

* PMOS differential pair.
* The mirror-side input is non-inverting at out.
XINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=3 nf=1 m=1
XINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=3 nf=1 m=1

* Long-channel NMOS current-mirror load.
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=1
XNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=1

* Additional output-pole compensation; external 1 pF load is unchanged.
CDOM out 0 0.6p

.ends dut
