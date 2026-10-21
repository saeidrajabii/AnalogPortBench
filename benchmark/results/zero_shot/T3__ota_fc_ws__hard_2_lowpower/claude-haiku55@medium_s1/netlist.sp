.subckt dut iref inp inn out
* ---- bias mirror: 20 uA reference -> NMOS tail (1.8x) ----
XMREF  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=12   L=0.5 nf=1 m=1
XMTAIL tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=21.6 L=0.5 nf=1 m=1

* ---- NMOS input pair ----
XM1 l  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---- NMOS cascode on inn branch (drives out) ----
XMNC out nc_b x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---- PMOS mirror load: diode on inp side, output copy into out ----
XMPD l  l    vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13.2 L=0.5 nf=1 m=1
XMPO po l    vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13.2 L=0.5 nf=1 m=1
XMPC out vbpc po  vdd sky130_fd_pr__pfet_01v8_lvt W=13.2 L=0.5 nf=1 m=1

* ---- cascode bias generators ----
* NMOS cascode gate: diode-connected device fed through 60k from vdd
XMNCB nc_b nc_b 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1
RNC   vdd  nc_b 60k
* PMOS cascode gate: diode-connected PMOS sinking through 200k to ground
XMPB  vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1
RPC   vbpc 0 200k
.ends dut
