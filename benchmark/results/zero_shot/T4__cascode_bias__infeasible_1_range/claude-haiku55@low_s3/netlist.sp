.subckt dut iin out vb1 vb2 vb3 vb4
* Self-biased PMOS reference: vb1 settles where the diode-connected
* PMOS current equals the NMOS sink (mirrored from iin).
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNB1 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Output devices (single-device mirrors, no cascode)
XMNOUT out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Bias outputs: vb2 and vb3 tied to the bias nodes through 1 mOhm
Rb2 vb1 vb2 1m
Rb3 vb4 vb3 1m
.ends dut
