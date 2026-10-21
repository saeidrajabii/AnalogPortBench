* SKY130 low-voltage, single-stage current-mirror OTA.
* Candidate sizing; specifications require verification with the supplied
* SKY130 models and testbench. No simulated performance is claimed.
.subckt dut iref inp inn out

* Reference-current mirror: nominal tail current = 8 * 20 uA.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=8

* NMOS differential input pair.
* Increasing inp steers current into nmir and raises out.
XINP nmir inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1.5 nf=1 m=1

* PMOS current-mirror active load.
XPMREF nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=1.5 nf=1 m=1
XPMOUT out nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=1.5 nf=1 m=1

.ends dut
