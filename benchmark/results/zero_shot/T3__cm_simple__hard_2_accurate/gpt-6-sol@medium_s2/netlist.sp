.subckt dut in out
* Convert the reference and output currents to voltages with matched resistors.
RREF in 0 1k
RSENSE sense 0 1k

* Bias for the differential amplifier.
RBIAS pb 0 220k
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=2 nf=1 m=1
XPTAIL pt pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=2 nf=1 m=1

* Compare the reference voltage with the sensed output current.
XPREF nref in pt vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
XPSENSE amp sense pt vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
XNREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XNAMP amp nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* Voltage-gain stage and low-compliance output transistor.
RGAIN vdd drive 800k
XGAIN drive amp 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XOUT out drive sense 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=0.5 nf=1 m=1
.ends dut
