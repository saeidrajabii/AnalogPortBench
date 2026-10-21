.subckt dut iref inp inn out
* Bias reference: 20 uA into a diode of 10 unit devices (2 uA each)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=10
* Tail current source: 4 units = 8 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
* NMOS input pair (inp drives the non-diode side so that out follows inp)
XM1 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2
XM2 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2
* PMOS current-mirror load, 1 uA per finger
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=4
XM4 n2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=4
* Second stage: PMOS common-source amplifier, ratio 4:1 to the load gives 16 uA
XM6 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=16
* NMOS current sink: 8 units = 16 uA
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=8
* Miller compensation with a nulling resistor
Rz n2 nc 6k
Cc nc out 0.7p
.ends dut
