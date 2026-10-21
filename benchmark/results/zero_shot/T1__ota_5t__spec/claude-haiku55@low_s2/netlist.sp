.subckt dut iref inp inn out
* Reference: NMOS diode sinks the 20 uA ideal current at iref
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS mirror copies 20 uA into node pb
XMNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS diode sourcing that current from vdd, sets the PMOS tail gate voltage
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* PMOS tail current source, about 20 uA
XMPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* PMOS input pair (PMOS input avoids the low common-mode problem at VCM = 0.5 V)
XMIP nA inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XMIN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
* NMOS current-mirror active load: diode on inp side, mirror output to out
XMLA nA nA 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XMLB out nA 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
.ends dut
