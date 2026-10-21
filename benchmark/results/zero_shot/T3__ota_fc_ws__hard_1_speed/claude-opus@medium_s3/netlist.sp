.subckt dut iref inp inn out
* ---------------- Bias generator (Cascode_Bias_WS replacement) ----------------
* 20uA reference: iref -> R1 -> MCR drain (nb); MR is the reference device (gate nb)
* vb3 (NMOS cascode gate) = node iref ; vb4 (NMOS sink gate) = nb
R1   iref nb 10k
XMCR nb   iref ncr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMR  ncr  nb   0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS cascode bias (vb2): 5uA branch, diode PMOS + resistor
XMPD vp2  vp2  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.35 nf=1 m=1
Rp   vp2  vb2  56k
XMNP vb2  nb   0   0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
* ---------------- Folded-cascode OTA ----------------
* tail (100uA)
XMT  ntail nb  0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5
* NMOS input pair (inp -> mirror side, inn -> output side)
XINP nfl  inp  ntail ntail sky130_fd_pr__nfet_01v8_lvt W=48 L=0.25 nf=1 m=1
XINN nfr  inn  ntail ntail sky130_fd_pr__nfet_01v8_lvt W=48 L=0.25 nf=1 m=1
* PMOS top current sources, self-biased from net1 (~90uA each)
XPTL nfl  net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=0.35 nf=1 m=2
XPTR nfr  net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=0.35 nf=1 m=2
* PMOS cascodes
XPCL net1 vb2  nfl vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XPCR out  vb2  nfr vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
* NMOS cascodes
XNCL net1 iref nsl 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XNCR out  iref nsr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
* NMOS current sinks (40uA each)
XNSL nsl  nb   0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XNSR nsr  nb   0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
.ends dut
