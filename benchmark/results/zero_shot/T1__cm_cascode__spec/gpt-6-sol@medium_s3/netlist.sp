.subckt dut in out
* Matched, self-biased NMOS cascode current mirror.
XREF_BIAS nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=60
XREF_CAS in in nb 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=30
XOUT_BIAS nx nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=60
XOUT_CAS out in nx 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=30
.ends dut
