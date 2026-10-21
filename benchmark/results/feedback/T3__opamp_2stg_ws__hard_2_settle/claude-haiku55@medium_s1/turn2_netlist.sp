.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference; the 20 uA source feeds its drain.
XMBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail current source, 4x reference (80 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
* First-stage NMOS pair. inn drives the diode-side device (non-inverting
* through the mirror into n2), inp drives the output-side device (inverting
* at n2). Stage 2 inverts again, so inn is the inverting input of the
* overall amplifier, which is what the out-to-inn feedback requires.
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* First-stage PMOS mirror load (MP1 diode-connected)
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Second stage: PMOS common-source driver with 9x NMOS current sink (180 uA)
XMP3 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=9
* Miller compensation with nulling resistor (out to n2)
CC1 out xcomp 1p
RZ1 xcomp n2 1k
.ends dut
