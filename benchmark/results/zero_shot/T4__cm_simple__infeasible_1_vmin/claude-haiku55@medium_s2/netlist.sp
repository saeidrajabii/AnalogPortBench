.subckt dut in out
* Reference branch: 20 uA enters 'in' (drain of MCR); self-biased cascode diode stack
XMCR in in nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMR  nb nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Output branch: cascode mirror, gates driven only by the reference branch
XMCO out in nm 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMO  nm nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
