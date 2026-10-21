.subckt dut in out
* PMOS current mirror. Long-channel devices are used to increase output
* resistance; the reference and output devices have identical geometry.
XMREF in in vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
XMOUT out in vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
.ends dut
