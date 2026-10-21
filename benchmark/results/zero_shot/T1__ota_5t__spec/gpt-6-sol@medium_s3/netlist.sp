.subckt dut iref inp inn out
* Diode-connected reference device mirrors the 20 uA bias current
* into the OTA tail device.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.8 nf=1 m=1

* Differential pair with a PMOS current-mirror load.
XINP mir inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XPMREF mir mir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1.2 nf=1 m=1
XPMOUT out mir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1.2 nf=1 m=1
.ends dut
