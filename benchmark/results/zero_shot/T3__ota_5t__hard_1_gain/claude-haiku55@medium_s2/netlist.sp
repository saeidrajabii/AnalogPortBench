.subckt dut iref inp inn out
* Reference: diode-connected NMOS at iref sinks the 20 uA reference (no current into a source)
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Mirror sink, 0.7x the reference -> 14 uA through the PMOS bias diode
XMS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1 nf=1 m=1
* PMOS bias diode sourcing 14 uA; gate voltage pb biases the tail
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
* PMOS tail current source, 14 uA
XMT s pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
* PMOS input pair: M1 (inp) drives the diode-side node d1, M2 (inn) drives out
XM1 d1 inp s vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 out inn s vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* NMOS current-mirror load: M3 diode on d1, M4 mirror output at out (1:1, balanced DC)
XM3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XM4 out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends dut
