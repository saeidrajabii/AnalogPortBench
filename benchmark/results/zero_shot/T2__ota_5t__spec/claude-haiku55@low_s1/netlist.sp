.subckt dut iref inp inn out
* Reference: diode-connected NMOS, 20 uA sunk from iref (drain-connected, not source-connected)
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Tail mirror, 2x the reference width, so 40 uA tail current
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS input pair, 20 uA per side, long L for output resistance
XM2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XM1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
* PMOS current-mirror load (diode-connected on the inp side)
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
