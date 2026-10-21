.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and mirror
RIN       iin   vb1   1m
XMNREF    iin   vb1   0     0     sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XMNBias   vb2   vb1   0     0     sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XMNSink   out   vb1   0     0     sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1

* PMOS reference and mirror
XMPRef    vb2   vb2   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
XMPSource out   vb2   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1

* Unloaded bias outputs
RVB3      vb3   vb1   1m
RVB4      vb4   vb2   1m
.ends dut
