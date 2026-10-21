.subckt dut iref inp inn out
* 20 uA reference mirror; the tail current is 5x the reference current.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP  nref inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XINN  out  inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XPL   nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=3 nf=1 m=1
XPR   out  nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=3 nf=1 m=1
.ends dut
