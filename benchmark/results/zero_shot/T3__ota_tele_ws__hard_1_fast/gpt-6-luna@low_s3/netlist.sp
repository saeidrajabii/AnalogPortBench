.subckt bias_gen iref nb pb
* The reference current sets an NMOS mirror; a mirrored branch biases the PMOS mirror.
XMR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMR1 nref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 nref pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends bias_gen

.subckt OTA_Telescopic inp inn out nb pb
* NMOS differential pair and PMOS current-mirror load
XTAIL tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XINP xp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN xn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPL xp xp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPR xn xp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Common-source second stage; Miller compensation with a series zero resistor
XOUTN out xp 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=5
XOUTP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=5
RCOMP xp ncomp 1k
CCOMP ncomp out 500f
.ends OTA_Telescopic

.subckt dut iref inp inn out
XBIAS iref nb pb bias_gen
XOTA inp inn out nb pb OTA_Telescopic
.ends dut
