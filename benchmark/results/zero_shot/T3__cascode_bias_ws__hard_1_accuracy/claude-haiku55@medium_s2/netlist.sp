.subckt dut iin out vb1 vb2 vb3 vb4
* Reference: 20 uA flows from vdd into iin; MNref is diode-connected at iin (current enters a drain)
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=14.2 L=1.0 nf=1 m=1
* NMOS sink mirror to out (trimmed for ~1:1 at Vds = 0.9 V)
XMsink out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=14.05 L=1.0 nf=1 m=1
* NMOS copy that sinks 20 uA from the PMOS bias node vb1
XMc vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=14.1 L=1.0 nf=1 m=1
* PMOS diode that sets vb1 (source at vdd)
XMpd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1.0 nf=1 m=1
* PMOS source mirror to out (trimmed for ~1:1 at Vsd = 0.3 V)
XMps out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28.2 L=1.0 nf=1 m=1
* Bias outputs (ties with negligible 1 mOhm resistance so all ports are connected)
Rb4 iin vb4 1m
Rb3 iin vb3 1m
Rb2 vb1 vb2 1m
.ends dut
