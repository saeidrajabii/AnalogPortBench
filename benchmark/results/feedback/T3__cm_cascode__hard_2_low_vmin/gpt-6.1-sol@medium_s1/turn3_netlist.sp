.subckt dut in out
RREF sr 0 500
ROUT so 0 500
RBIAS sb 0 5k

XREF in in sr 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=8 nf=1 m=12000
XOUT out vg so 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=8 nf=1 m=12000

XBIAS bp in sb 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=8 nf=1 m=1200
XPBIAS bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=8 nf=1 m=1
XPTAIL tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=8 nf=1 m=1
XPLOAD vg bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=8 nf=1 m=1

XPSENSE nd so tail vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=8 nf=1 m=1
XPREF va sr tail vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=8 nf=1 m=1
XNDIODE nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=1
XNMIRROR va nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=8 nf=1 m=1
XNGAIN vg va 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=8 nf=1 m=1

CCOMP va vg 10p
.ends dut
