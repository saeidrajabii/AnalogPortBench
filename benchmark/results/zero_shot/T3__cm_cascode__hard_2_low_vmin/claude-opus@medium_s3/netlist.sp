.subckt CM_LV_REG in out
* 75 mV reference for the bottom-device drain voltage
RV1 vdd vref 150k
RV2 vref 0 10k

* PMOS tail bias, about 4 uA
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
RB pb 0 150k

* Mirror core: weak inversion, Vds held at Vref
XM1 net1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=15
XM0 net2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=15

* Regulated cascodes (wide, so the triode drop is small at low Vout)
XMN3 in  g1 net1 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.3 nf=1 m=1
XMN2 out g2 net2 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.3 nf=1 m=1

* Amplifier 1: holds net1 = vref (drives g1)
XMT1 t1 pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMA1 d1 vref t1 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB1 g1 net1 t1 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XML1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XML2 g1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Amplifier 2: identical, holds net2 = vref (drives g2)
XMT2 t2 pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMA2 d2 vref t2 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB2 g2 net2 t2 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XML3 d2 d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XML4 g2 d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends CM_LV_REG

.subckt dut in out
XI0 in out CM_LV_REG
.ends dut
