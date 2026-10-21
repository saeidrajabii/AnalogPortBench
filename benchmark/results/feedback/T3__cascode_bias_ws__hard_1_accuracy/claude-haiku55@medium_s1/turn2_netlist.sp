.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode: iin sinks the 20 uA reference
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* PMOS bottom-gate bias vb1: diode PMOS (sourced from vdd) balanced by NMOS sink copy of Iref
XMPD1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMNS1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* PMOS cascode bias vb2: replica PMOS (gate vb1) over diode PMOS, pinned by diode NMOS
XMPR px vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMPCD vb2 vb2 px vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMNd2 vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* NMOS bottom-gate bias vb4: PMOS current copy into NMOS diode
XMPS4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMND4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* NMOS cascode bias vb3: ideal resistive divider (not drawn from iin)
R1 vdd vb3 10k
R2 vb3 0 11.8k
* Output stage: PMOS cascode source (from vdd) and NMOS cascode sink (to ground)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
.ends dut
