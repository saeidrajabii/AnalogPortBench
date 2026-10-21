.subckt dut iref inp inn out
* ---------------- bias: Iref = 20uA into stacked NMOS diodes ----------------
* vb4 = Vgs(MB1); vb3 = node iref = vb4 + Vgs(MB3) (cascode gate bias)
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1 nf=1 m=2
XMB3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.5 nf=1 m=2
* PMOS cascode gate bias (5uA), narrow/long diode -> Vbp ~ 0.25-0.35 V
XMNB vbp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.25 L=1 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.7 L=1 nf=1 m=1
* ---------------- stage 1: NMOS pair, low-voltage PMOS cascode mirror ------
XMT tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1 nf=1 m=6
XM1 n08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XMC1 n08 vbp nc1 vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.35 nf=1 m=3
XMC2 n9 vbp nc2 vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.35 nf=1 m=3
XMT1 nc1 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.35 nf=1 m=3
XMT2 nc2 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.35 nf=1 m=3
* ---------------- stage 2: PMOS CS + cascoded NMOS sink (150uA) ------------
XMP2 out n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.35 nf=1 m=15
XMN5 out iref nx 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.5 nf=1 m=15
XMN4 nx vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1 nf=1 m=15
* ---------------- Miller compensation with LHP-zero nulling resistor -------
Rz n08 nz 2k
Cc nz out 0.7p
.ends dut
