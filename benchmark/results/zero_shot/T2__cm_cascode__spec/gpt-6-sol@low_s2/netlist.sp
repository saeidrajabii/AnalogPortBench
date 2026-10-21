.subckt dut in out
* The reference current flows through Rbias and the diode-connected input device.
* The resistor raises the cascode-gate bias without adding another diode drop.
Rbias in bias 10k
XREF bias bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=250 L=4 nf=1 m=1
XLOW mid bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=250 L=4 nf=1 m=1
XCAS out in mid 0 sky130_fd_pr__nfet_01v8_lvt W=250 L=4 nf=1 m=1
.ends dut
