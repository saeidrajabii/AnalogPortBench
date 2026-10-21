.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current input and NMOS mirror.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XNPBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100

* PMOS mirror bias, supplied by a mirrored copy of the reference current.
XPPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=10 nf=1 m=100

* Diode-connected NMOS cascode-bias branch.
XNCB_BOT ncb_src iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XNCB_TOP vb3 vb3 ncb_src 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XPCB_SRC vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=10 nf=1 m=100

* Diode-connected PMOS cascode-bias branch.
XPCB_BOT pcb_src iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XPCB_TOP vb2 vb3 pcb_src 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XPCREF_TOP pcr_src vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=10 nf=1 m=100
XPCREF_BOT vb2 vb2 pcr_src vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=10 nf=1 m=100

* Cascoded output sink and source.
XNOUT_BOT nout_src iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XNOUT_TOP out vb3 nout_src 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=10 nf=1 m=100
XPOUT_TOP pout_src vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=10 nf=1 m=101
XPOUT_BOT out vb2 pout_src vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=10 nf=1 m=100

RVB4 iin vb4 1
.ends dut
