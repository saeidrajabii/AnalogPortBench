.subckt dut iin out vb1 vb2 vb3 vb4
* 20 uA reference and NMOS current mirrors
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNSINK vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS vb3 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNLOW vb4 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS reference and bias current source
XMPREF npr npr vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNPM npr iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPTOP vb1 npr vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPLOW vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS cascode sink
XMNOUTLOW nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNOUTTOP out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS cascode source
XMPOUTLOW psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPOUTTOP out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
