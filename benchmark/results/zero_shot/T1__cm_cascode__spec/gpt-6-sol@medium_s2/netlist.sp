.subckt dut in out
* The reference device and output device form the current mirror.
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMIR mid in 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XCAS out cbias mid 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* Set the cascode gate bias independently of the reference-current path.
RHI vdd cbias 118k
RLO cbias 0 62k
.ends dut
