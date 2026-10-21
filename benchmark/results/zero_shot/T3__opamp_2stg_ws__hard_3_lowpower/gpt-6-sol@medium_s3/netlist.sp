.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=2.5 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2.5 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load.
XINM nmir inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=2.8 nf=1 m=1
XINP n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=2.8 nf=1 m=1
XLOAD1 nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=68 L=3 nf=1 m=1
XLOAD2 n1 nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=68 L=3 nf=1 m=1

* Second gain stage and series-RC Miller compensation.
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=125 L=2.2 nf=1 m=1
RZ n1 ncc 2.7k
CC ncc out 0.85p
.ends dut
