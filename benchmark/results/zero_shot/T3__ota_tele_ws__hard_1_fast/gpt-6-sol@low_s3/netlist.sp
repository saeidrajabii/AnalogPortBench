.subckt dut iref inp inn out
* The 20 uA reference is converted to a voltage before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=8

* Cascode-gate bias.
RBIAS vdd ncas 20k
XBIAS ncas ncas iref 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Differential input pair and NMOS output cascode.
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XINN right inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XCASL pmirror ncas left 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.35 nf=1 m=1
XCASR out ncas right 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.35 nf=1 m=1

* Long-channel PMOS current-mirror load.
XPREF pmirror pmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=130 L=2.5 nf=1 m=1
XPOUT out pmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=130 L=2.5 nf=1 m=1
.ends dut
