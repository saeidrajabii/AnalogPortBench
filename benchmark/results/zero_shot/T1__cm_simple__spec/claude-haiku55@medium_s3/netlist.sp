.subckt dut in out
* Simple NMOS current mirror, 1:1 ratio, long channel for output resistance and low error.
* Reference diode: drain and gate on 'in', source on ground, so the 20 uA reference enters the drain.
XM1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Output device: gate on 'in', drain on 'out', sinks the mirrored current from 'out'.
XM2 out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
