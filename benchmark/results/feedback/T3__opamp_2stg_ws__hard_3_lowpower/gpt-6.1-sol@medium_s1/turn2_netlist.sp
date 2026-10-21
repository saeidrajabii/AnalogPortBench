.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=2
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=5

* Cascode gate biases.
RNBHI vdd bn 180k
RNBLO bn 0 1.02meg
RPBHI vdd bp 950k
RPBLO bp 0 250k
CNBIAS bn 0 2p
CPBIAS bp 0 2p

* Differential input pair.
XINP dn inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XINN dm inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* NMOS cascodes.
XNCOUT stage1 bn dn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNCMIR mirror bn dm 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPDIO pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XPLOAD ps pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XPCMIR mirror bp pg vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPCOUT stage1 bp ps vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Common-source output stage.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RCOMP stage1 comp 3.3k
CCOMP comp out 550f

.ends dut
