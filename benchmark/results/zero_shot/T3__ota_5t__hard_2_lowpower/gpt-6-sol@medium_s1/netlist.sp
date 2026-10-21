.subckt dut iref inp inn out
* A diode-connected reference device establishes the gate bias for a
* smaller tail-current mirror. The reference current enters its drain.
XREF  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XTAIL tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=21 L=0.8 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP  pdiode inp tail 0   sky130_fd_pr__nfet_01v8_lvt W=36 L=0.9 nf=1 m=1
XINN  out    inn tail 0   sky130_fd_pr__nfet_01v8_lvt W=36 L=0.9 nf=1 m=1
XPREF pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XPOUT out    pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
.ends dut
