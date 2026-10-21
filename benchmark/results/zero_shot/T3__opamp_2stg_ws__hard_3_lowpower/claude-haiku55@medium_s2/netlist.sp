.subckt dut iref inp inn out
* ---- reference mirror (iref is the diode-connected NMOS, current enters its drain)
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---- tail current source: 30 uA (1.5x reference)
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* ---- PMOS bias generator: 20 uA sunk through diode-connected PMOS
XMNB vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=17 L=1 nf=1 m=1
* ---- second-stage PMOS current source: ~100 uA (about 4.9x mirror)
XMPS2 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=83 L=1 nf=1 m=1
* ---- second-stage NMOS common-source amplifier
XMNS2 out pout1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* ---- NMOS differential input pair
XMIN1 pm inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMIN2 pout1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* ---- PMOS current-mirror load
XMP1 pm pm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP2 pout1 pm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
* ---- Miller compensation with nulling resistor
CC nc out 400f
RZ nc pout1 2.5k
.ends dut
