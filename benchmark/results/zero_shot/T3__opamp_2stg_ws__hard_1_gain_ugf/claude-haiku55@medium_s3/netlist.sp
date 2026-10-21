.subckt dut iref inp inn out
* Bias: 20 uA reference diode (iref is the drain/gate of MR0, source at ground)
XMR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
* Tail current source, 4x reference (about 80 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=2 nf=1 m=1
* Input differential pair, about 40 uA per side
* inn drives the diode-side device, so inn is the inverting input and inp the non-inverting one
XM1 dA inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* PMOS mirror load (diode on dA)
XMP1 dA dA vdd vdd sky130_fd_pr__pfet_01v8_lvt W=56 L=2 nf=1 m=1
XMPB n2 dA vdd vdd sky130_fd_pr__pfet_01v8_lvt W=56 L=2 nf=1 m=1
* Second stage: PMOS common source, about 200 uA, with NMOS current sink (10x reference)
XMP2 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMS2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
* Miller compensation with nulling resistor (n2 -> RZ -> nc -> CC -> out)
RZ n2 nc 1.5k
CC nc out 0.5p
.ends dut
