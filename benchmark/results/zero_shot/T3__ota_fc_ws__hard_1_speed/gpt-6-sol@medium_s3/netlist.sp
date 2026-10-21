.subckt dut iref inp inn out
* A diode-connected reference device mirrors the 20 uA reference
* into the differential-pair tail; iref does not drive a source.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=0.5 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP  mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=130 L=1.6 nf=1 m=1
XINN  out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=130 L=1.6 nf=1 m=1
XPDI  mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1
XPMIR out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1
.ends dut
