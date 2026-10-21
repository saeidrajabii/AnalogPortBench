.subckt dut iref inp inn out
* Bias: 20 uA reference -> tail mirror (wide for low Vdsat)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
* NMOS input pair (wide -> weak inversion, high gm, low Vgs)
XM1  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=2
XM2  n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=2
* PMOS mirror load (long for gain)
XM3  n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XM4  n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
* Replica of second stage (sets output sink current -> zero systematic offset)
XM5R nr n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM6R nr nr 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
* Second stage
XM5  out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=4
XM6  out nr 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=4
* Miller compensation with nulling resistor
Rz   n2 nz 5k
Cc   nz out 1.3p
.ends dut
