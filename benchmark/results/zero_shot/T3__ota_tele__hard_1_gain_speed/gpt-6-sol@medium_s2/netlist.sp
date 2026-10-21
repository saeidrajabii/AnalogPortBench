.subckt dut iref inp inn out
* The 20 uA reference current flows through the bias resistors
* into a diode-connected NMOS, then to ground.
RBIAS1 iref vco 9k
RBIAS2 vco vbn 7k
XREF vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1

* Differential input stage with NMOS cascodes and a PMOS mirror load.
XTAIL tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XINP xp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
XINN xn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
XCASP pd iref xp 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=2 nf=1 m=1
XCASN q iref xn 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=2 nf=1 m=1
XPMD pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1
XPMM q pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1

* Common-source output stage with a cascoded NMOS current sink.
XPOUT out q vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=3 nf=1 m=1
XSINK ns vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2 nf=1 m=1
XOCAS out vco ns 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* Series-RC Miller compensation.
RZ q cmid 1.8k
CC cmid out 0.95p
.ends dut
