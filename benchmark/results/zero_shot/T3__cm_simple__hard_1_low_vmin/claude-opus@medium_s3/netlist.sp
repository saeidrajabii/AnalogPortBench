.subckt dut in out
* matched mirror pair, common gate driven by error amplifier
XMN1 in  g 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=2
XMN0 out g 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=2
* error amplifier: forces V(in) = V(out)
* resistor tail (no headroom issue at 0.9 V common mode)
RT vdd tail 100k
* PMOS input pair: non-inverting input = in, inverting input = out
XMPA da in  tail vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=2
XMPB g  out tail vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=2
* NMOS current-mirror load, single-ended output at g
XMLA da da 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMLB g  da 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
