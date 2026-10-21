.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
* reference diode (20 uA, mirrored by unit W=2/L=1 devices, 2 uA per unit)
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=10
* PMOS current-source bias vbp1 (2 uA)
XMNs1 vbp1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPb1 vbp1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* PMOS cascode bias vbp2 (2 uA, low W/L diode)
XMNs2 vbp2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPb2 vbp2 vbp2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1.6 nf=1 m=1
* NMOS cascode bias vbnc (2 uA, low W/L diode)
XMPs3 vbnc vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMNc vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2.5 nf=1 m=1
* ---------------- Stage 1: folded cascode ----------------
* tail 16 uA
XMNt ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=8
* NMOS input pair
XMinp fp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.18 nf=1 m=1
XMinn fn inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.18 nf=1 m=1
* PMOS current sources at fold nodes (20 uA each)
XMPtp fp vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=10
XMPtn fn vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=10
* PMOS cascodes (12 uA each)
XMPcp d1 vbp2 fp vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XMPcn cn vbp2 fn vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
* wide-swing NMOS cascode mirror load
XMNcn cn vbnc sn 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMNcp d1 vbnc sp 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMNbn sn cn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMNbp sp cn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* ---------------- Stage 2: cascoded NMOS CS, PMOS source load (64 uA) ----------------
XMN2 x2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.25 nf=1 m=1
XMN2c out vbnc x2 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XMP2 out vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=32
* ---------------- Miller compensation with nulling resistor ----------------
Rz d1 nz 5.5k
Cc nz out 0.36p
.ends dut
