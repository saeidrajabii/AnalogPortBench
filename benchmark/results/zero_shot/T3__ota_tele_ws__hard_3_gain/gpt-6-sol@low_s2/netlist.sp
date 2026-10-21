.subckt dut iref inp inn out
* The 20 uA reference flows into a diode-connected NMOS and is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1

* NMOS differential pair with a 40 uA mirrored tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=2
XINP load_d inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2
XINN gain1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2

* PMOS current-mirror load.
XLOAD_D load_d load_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XLOAD_O gain1 load_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Common-source output stage, biased at approximately 80 uA.
XOUT out gain1 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1.5 nf=1 m=4
XOUT_BIAS out load_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=4

* Miller compensation with a series nulling resistor.
RNULL gain1 comp 600
CCOMP comp out 0.7p
.ends dut
