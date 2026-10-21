.subckt dut iin out vb1 vb2 vb3 vb4
* Diode-connected NMOS reference; the reference current flows through its drain.
XMNREF   iin   iin   0   0   sky130_fd_pr__nfet_01v8_lvt W=4000 L=40 nf=1 m=1
RVB1     vb1   iin   1G

* NMOS mirror reference branch and output sink
XMNBias  vb2   iin   0   0   sky130_fd_pr__nfet_01v8_lvt W=4000 L=40 nf=1 m=1
XMNSink  out   iin   0   0   sky130_fd_pr__nfet_01v8_lvt W=4000 L=40 nf=1 m=1

* PMOS diode-connected reference branch and output source
XMPRef   vb2   vb2   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=40 nf=1 m=1
XMPSource out  vb2   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=40 nf=1 m=1

* Additional unloaded bias outputs
RVB3     vb3   vb1   1G
RVB4     vb4   vb2   1G
.ends dut
