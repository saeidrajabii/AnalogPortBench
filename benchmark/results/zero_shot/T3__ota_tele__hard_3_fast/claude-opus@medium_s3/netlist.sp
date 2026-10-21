.subckt dut iref inp inn out
* ---------------- bias ----------------
* iref -> R1 -> diode MB1 : vcn = Vgs(MB1) + 20uA*17k  (cascode bias with no extra current)
R1   iref nb 17k
XMB1 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4
* tail current source: 18/4 * 20uA = 90uA
XMT  tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=18
* PMOS cascode bias: vcp = VDD - Vsg(MB7) - 5uA*40k
XMB8 vcp nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RP   np vcp 40k
XMB7 np np vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.4 L=0.35 nf=1 m=1
* ---------------- telescopic cascode OTA ----------------
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.2 nf=1 m=4
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.2 nf=1 m=4
XM3 d1  nb_cas x1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.25 nf=1 m=4
XM4 out nb_cas x2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.25 nf=1 m=4
XM5 d1  vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=2
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=2
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=3
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=3
* NMOS cascode gate taken from the top of R1
RCN iref nb_cas 0
.ends dut
