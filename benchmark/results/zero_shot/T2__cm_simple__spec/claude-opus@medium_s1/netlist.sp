.subckt dut in out
* Self-biased wide-swing (low-voltage) cascode current mirror, SKY130 LVT
* Reference branch: Iref -> in (cascode gate) -> R -> nb (bottom gates) -> M3 cascode -> x -> M1
R1  in nb 10k
XM3 nb in x  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM1 x  nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Output branch
XM4 out in y 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 y   nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
