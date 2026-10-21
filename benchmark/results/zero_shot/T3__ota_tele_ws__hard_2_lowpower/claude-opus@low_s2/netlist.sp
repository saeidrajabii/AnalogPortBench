.subckt dut iref inp inn out
* bias: iref diode, mirrored to 10uA PMOS diode
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMS  pb   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPB pb   pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* tail 20uA
XMT  tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* PMOS input pair
XM1  d1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  x  inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS mirror load
XM3  d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XM4  x  d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
* second stage 30uA
XM5  out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XM6  out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
* Miller compensation with nulling resistor
Rz   x nz 3k
Cc   nz out 1.5p
.ends dut
