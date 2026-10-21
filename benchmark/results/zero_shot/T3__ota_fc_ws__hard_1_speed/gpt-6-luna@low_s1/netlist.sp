.subckt dut iref inp inn out
* PMOS reference mirror: iref is sunk by the diode-connected reference device.
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPBIAS nbias nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
* NMOS diode branch establishes the input-pair tail bias.
XMNBIAS nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
* Tail current mirror, nominally 8x the NMOS bias current.
XMTAIL ntail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=8
* NMOS differential input pair.
XMINP nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMINN out inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS current-mirror load.
XMPLD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPRD out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
