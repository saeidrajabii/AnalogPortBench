.subckt dut iref inp inn out
* Reference: 20 uA into diode-connected NMOS (W=2.8 um sets the 7.14 uA/um mirror unit)
MNr   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.8 L=0.5 nf=1 m=1

* Bias mirrors from iref
MNt   ts   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.36 L=0.5 nf=1 m=1   * tail, 24 uA
MNpb  pb   iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.1  L=0.5 nf=1 m=1   * 15 uA into PMOS diode
MNx   x    iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1   * 3 uA fold-node sink
MNsk  w    iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1   * 3 uA output-branch sink

* NMOS input pair (inp drives the output-side device)
MN1   x    inn ts 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
MN2   out  inp ts 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* NMOS cascode in output branch
MNcn  out  nbc w  0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1

* PMOS top current sources (15 uA each) and PMOS cascode
MPd   pb   pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1   * diode, sets pb
MPs1  x    pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
MPs2  u    pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
MPc   out  pbc u  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Cascode gate bias (resistive dividers)
R1 vdd pbc 600k
R2 pbc 0   200k
R3 vdd nbc 200k
R4 nbc 0   240k
.ends dut
