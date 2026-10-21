.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference; the 20 uA source feeds its drain.
XMBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail current source, 4x reference (80 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
* First-stage NMOS pair: inn on diode side, inp on output side.
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
* First-stage PMOS mirror load (MP1 diode-connected), low Vov for headroom
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
* Second stage: wide PMOS common-source driver (low Vdsat) with 9x NMOS sink (180 uA)
XMP3 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
XMN5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=9
* Miller compensation with nulling resistor (out to n2)
CC1 out xcomp 0.5p
RZ1 xcomp n2 1k
.ends dut
