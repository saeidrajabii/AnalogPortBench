.subckt dut in out
* Reference branch and wide-swing cascode bias.
RBIAS in nref 8k
XREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=10 nf=1 m=1

* Long-channel output mirror and cascode.
XMIR nmid nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=10 nf=1 m=1
XCAS out in nmid 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=10 nf=1 m=1
.ends dut
