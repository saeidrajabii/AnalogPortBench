* Candidate regulated-cascode mirror.
* Performance must be verified with the supplied SKY130 model library.

.subckt cm_servo sense ref pb drive
* PMOS-input differential stage with NMOS current-mirror load.
XPTAIL tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XPSENSE nd sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPREF nx ref tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XNDIODE nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNLOAD nx nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Inverting second stage.
XPLOAD drive pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XNGAIN drive nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
CCOMP nx drive 2p
.ends cm_servo

.subckt dut in out
* Matched reference and output current-setting devices.
XNREF nref in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XNOUT nout in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* Independently regulated cascodes equalize the lower drain voltages.
XCREF in gref nref 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XCOUT out gout nout 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XAREF nref vref pb gref cm_servo
XAOUT nout vref pb gout cm_servo

* Auxiliary mirrored current supplies the amplifier bias and
* establishes a low drain-voltage reference.
XNBIAS pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XPVREF vref pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
RVREF vref 0 4k
.ends dut
