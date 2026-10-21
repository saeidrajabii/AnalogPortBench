.subckt dut in out
* NMOS cascode current mirror, sized for high output resistance.
* in: diode-connected reference branch (MN3 over MN1).
* out: output branch (MN2 over MN0), gates tied to the reference nodes.
* Long L (4 um) raises ro of each device; W/L = 6 keeps Vov near 0.15 V at 20 uA.
* Bulks tied to ground.
XM3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=4 nf=1 m=1
XM1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=4 nf=1 m=1
XM2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=4 nf=1 m=1
XM0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=4 nf=1 m=1
.ends dut
