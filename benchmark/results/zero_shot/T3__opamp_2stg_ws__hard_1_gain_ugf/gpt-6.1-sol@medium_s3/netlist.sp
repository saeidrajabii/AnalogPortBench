* SKY130 port candidate; specification compliance requires simulation
* with the testbench's TT device models.
*
* Two-stage amplifier with Miller compensation.
* The reference current is mirrored into the tail and output branches.
* Cascoding the output current sink increases second-stage DC gain.

.subckt dut iref inp inn out

* Stacked diode-connected reference devices: 20 uA.
XREF0 vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XREF1 iref iref vb 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Differential-pair tail current: nominally 100 uA.
XTAIL tail vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=5

* NMOS input pair.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1

* PMOS current-mirror load.
XLOAD0 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XLOAD1 first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* PMOS common-source output stage.
XOUTP out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=1 nf=1 m=1

* Cascoded output sink: nominally 200 uA.
XOUTN0 sink vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=10
XOUTN1 out iref sink 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=10

* Series-R Miller compensation.
RCOMP first comp 1.8k
CCOMP comp out 1.1p

.ends dut
