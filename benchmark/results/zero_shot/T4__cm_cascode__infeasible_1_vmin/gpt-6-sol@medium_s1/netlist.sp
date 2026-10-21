.subckt dut in out
* Reference-only biased NMOS cascode current mirror
XM1 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2.5 nf=1 m=1
XM2 in in nb nb sky130_fd_pr__nfet_01v8_lvt W=80 L=2.5 nf=1 m=1
XM3 nx nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2.5 nf=1 m=1
XM4 out in nx nx sky130_fd_pr__nfet_01v8_lvt W=80 L=2.5 nf=1 m=1
.ends dut
