.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current diode and NMOS mirror
XNREF  iin iin 0   0   sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XNB    vb1 iin 0   0   sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1

* PMOS reference and output current source; NMOS output current sink
XPREF  vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XPSRC  out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1005 L=10 nf=1 m=1
XNSNK  out iin 0   0   sky130_fd_pr__nfet_01v8_lvt W=995 L=10 nf=1 m=1

* Expose the available mirror biases on the remaining unloaded ports
RVB2 vb2 iin 1u
RVB3 vb3 vb1 1u
RVB4 vb4 iin 1u
.ends dut
