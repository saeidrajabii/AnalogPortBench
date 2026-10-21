.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
* Reference mirror: iref is the diode node (20 uA from the ideal source)
XMNr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail mirror, 20 uA
XMNt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* 6 uA sink feeding PMOS diode -> vbp1 (top current-source gate)
XMNx vbp1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
XMPd vbp1 vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
* Cascode NMOS gate vbn2: resistor-biased diode
R1 vdd vbn2 100k
XMNd vbn2 vbn2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* Cascode PMOS gate vbp2: PMOS diode from vdd, resistor to ground
XMPd2 vbp2 vbp2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
R2 vbp2 0 100k

* ---------------- Folded-cascode OTA ----------------
* Top PMOS current sources (16 uA each)
XMPTl Fl vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.2 L=0.5 nf=1 m=1
XMPTr Fr vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.2 L=0.5 nf=1 m=1
* PMOS cascodes: left feeds the mirror, right feeds out
XMPCl Lz vbp2 Fl vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMPCr out vbp2 Fr vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* Input pair (10 uA each)
XMNp Fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNn Fr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Left branch: cascode diode into NMOS mirror (inp path is non-inverting)
XMNcd Lz vbn2 Ld 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMNmd Ld Ld 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
* Output branch: mirror sink with NMOS cascode, sinks the left-mirrored current
XMNmo Oo Ld 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
XMNco out vbn2 Oo 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
.ends dut
