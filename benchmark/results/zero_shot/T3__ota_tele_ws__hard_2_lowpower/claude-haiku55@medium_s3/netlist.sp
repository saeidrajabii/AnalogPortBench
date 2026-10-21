.subckt dut iref inp inn out
* ---- Bias generation (all currents derived from iref) ----
* Reference NMOS mirror: diode-connected, carries the 20 uA reference
XMref  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail mirror: 30 uA (1.5x reference)
XMtail ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* 5 uA sink that sets the PMOS cascode-gate bias node vbpc
XMnsink vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* PMOS diode from vdd to vbpc (self-biased at about 5 uA, Vsg about 0.7 V)
XMpdi vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* PMOS 5 uA source feeding the NMOS diode that generates the NMOS cascode gate bias vbnc
XMpcs vbnc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* NMOS diode generating vbnc (about 0.74 V)
XMnc  vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1

* ---- Telescopic OTA core ----
* Input pair, tail current 30 uA, 15 uA per side
XM1   nl inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2   nr inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* NMOS cascodes
XMcl  n82 vbnc nl 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMcr  out vbnc nr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS load: left branch (current source MP0 with cascode MP1, gate of both mirror devices at n82)
XMp0  n0100 n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XMp1  n82 vbpc n0100 vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1

* PMOS load: right branch (mirror MP2 of MP0, cascode MP3 to out)
XMp2  n097 n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XMp3  out vbpc n097 vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1
.ends dut
