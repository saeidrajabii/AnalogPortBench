.subckt dut in out
* NMOS current mirror, long-channel for high output resistance.
* Reference diode: drain and gate at `in`, source at ground. The 20 uA reference enters `in`.
* Output device: same gate bias, drain at `out`, so Iout sinks from `out` to ground.
XM1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.3 L=1 nf=1 m=1
XM0 out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.3 L=1 nf=1 m=1
.ends dut
