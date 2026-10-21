.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode: the 20 uA ideal source from vdd is forced through this device
XMr iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* vb4 follows iin (1 mOhm link, unloaded output)
Rvb4 iin vb4 1m

* NMOS sink copies that generate PMOS bias currents
XMm1 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMm2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS diode-connected bias devices
XMpd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XMpd2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1

* vb3 generator: PMOS copy of 20 uA pushed into an NMOS diode
XMps3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XMd3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* NMOS sink: bottom device and cascode
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS source: bottom device and cascode
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
.ends dut
