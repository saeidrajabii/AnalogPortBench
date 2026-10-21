.subckt dut iref inp inn out
* Bias: NMOS diode carries the 20 uA reference
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Tail current source, 1:1 mirror of iref (20 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS bias: diode-connected PMOS sinks 20 uA via NMOS mirror
XMPR vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XMBN vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS mirror load
XM1  dA inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XML1 dA dA vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XML2 d1 dA vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1

* Second stage: NMOS common source with PMOS current-source load (50 uA)
XM3  out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XM4  out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
CC  out nz 0.8p
RZ  nz d1 2k
.ends dut
