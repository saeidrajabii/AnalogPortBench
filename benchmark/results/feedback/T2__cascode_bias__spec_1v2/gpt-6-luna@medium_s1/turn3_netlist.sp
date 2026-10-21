.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS diode reference and matched sink mirror
XMNREF vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XMNSINK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XMNPMREF vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1

* PMOS diode reference and matched source mirror
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=10 nf=1 m=1
XMPSOURCE out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=10 nf=1 m=1

* Bias-port ties; the ports are unloaded in the test
RNTIE vb3 vb4 1u
RPTIE vb1 vb2 1u
.ends dut
