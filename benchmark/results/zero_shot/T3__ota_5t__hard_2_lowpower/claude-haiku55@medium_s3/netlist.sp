.subckt dut iref inp inn out
* Reference sink: diode-connected NMOS, carries the 20 uA ideal source current
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8.4 L=1 nf=1 m=1
* Mirror of reference, ratio ~0.025 -> ~0.5 uA, drives PMOS bias diode
XMN2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2 nf=1 m=1
* PMOS diode-connected bias device (source vdd, drain=gate=pb)
XMPD pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
* PMOS tail, mirrored from pb, ~9 uA
XMPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1
* PMOS input pair (weak inversion for high gm/Id)
XMPA d1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMPB out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
* NMOS current-mirror load (long L for higher output resistance)
XMND d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XMNO out d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
.ends dut
