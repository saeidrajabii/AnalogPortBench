.subckt dut in out
* Self-biased NMOS cascode current mirror.
* Increased widths reduce overdrive voltage; long channels improve output resistance.
XMN0 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMN1 in in nb 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMN2 nx nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMN3 out in nx 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
.ends dut
