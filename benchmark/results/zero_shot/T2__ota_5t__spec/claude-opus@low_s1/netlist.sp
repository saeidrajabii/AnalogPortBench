.subckt dut iref inp inn out
* NMOS reference diode (iref mirrored)
XMN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN1 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS bias diode and tail (1:2)
XMP0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP1 tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=2
* PMOS input pair
XMP2 n1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP3 out inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS mirror load
XMN2 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN3 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
