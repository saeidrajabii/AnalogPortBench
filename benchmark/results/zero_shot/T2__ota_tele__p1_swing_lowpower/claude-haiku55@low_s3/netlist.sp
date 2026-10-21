.subckt dut iref inp inn out
* Bias: diode-connected reference (iref = 20 uA)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current source, 2x unit = 40 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* NMOS input differential pair
XM1 o1a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* PMOS mirror load (first stage)
XMP3 o1a o1a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP4 o1 o1a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Second stage: PMOS common-source driver and NMOS current-source load (3x mirror, 60 uA)
XMP5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMN5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Miller compensation
CC o1 out 1p
.ends dut
