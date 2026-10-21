.subckt dut in out
* Reference diode-connected device (gate and drain at 'in')
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1.0 nf=1 m=3
* Output device, same gate voltage, sinks mirrored current into 'out'
XMOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1.0 nf=1 m=3
.ends dut
