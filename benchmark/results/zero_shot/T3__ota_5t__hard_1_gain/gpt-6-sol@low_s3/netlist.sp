.subckt dut iref inp inn out
* The 20 uA reference is converted to a voltage by a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Approximately 10 uA tail current; PMOS mirror loads the input pair.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XINN gain inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=1 nf=1 m=1
XPMI gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=1 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XDRV out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
RCOMP gain comp 4k
CCOMP comp out 1p
.ends dut
