.subckt dut iref inp inn out
* ---- bias ----
XMb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMs1 pg iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMpd pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMpe vbn pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMnc vbn vbn nx 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
Rb nx 0 24k
XMs2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMpc vbp vbp px vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
Rp vdd px 15k
* ---- OTA ----
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM1 n74 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM3 n30 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMc0 net082 vbn n74 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=1
XMc2 out vbn n30 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=1
XMp0 net0100 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XMp1 net082 vbp net0100 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XMp2 net097 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XMp3 out vbp net097 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
.ends dut
