.subckt dut iref inp inn out
* ---------------- Bias generator ----------------
XNR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XN1  vb1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP1  vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* NMOS cascode gate: vb3 = Vgs + 20uA*10k
XP2  vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XN2  vb3 vb3 ns3 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
R3   ns3 0 10k
* PMOS cascode gate: vb2 = VDD - Vsg - 20uA*10k
XN3  vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP3  vb2 vb2 ps2 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
R2   vdd ps2 10k
* ---------------- Folded-cascode OTA ----------------
* tail 80uA
XNT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=4
* NMOS input pair
XNIP fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=2
XNIN fr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=2
* PMOS top (mirror load, gate on net1)
XPTL fl net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=4
XPTR fr net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=4
* PMOS cascodes
XPCL net1 vb2 fl vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=2
XPCR out  vb2 fr vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=2
* NMOS cascoded sinks (40uA each)
XNCL net1 vb3 sl 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XNCR out  vb3 sr 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XNSL sl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XNSR sr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
.ends dut
