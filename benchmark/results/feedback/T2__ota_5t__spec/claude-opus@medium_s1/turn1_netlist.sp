.subckt dut iref inp inn out
* Bias: iref -> diode-connected NMOS, mirrored 1:2 into the OTA tail (40 uA)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* NMOS input differential pair (wide, weak/moderate inversion for low Vgs)
XM1  net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2  out  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS current-mirror load
XM3  net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XM4  out  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
.ends dut
