* Two-stage, Miller-compensated candidate.
* Performance must be verified with the supplied SKY130 models and testbench.
* W and L are in micrometres.

.subckt dut iref inp inn out

* Diode-connected reference; all operating currents are mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* Nominal 16-uA differential-pair tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=1.5 nf=1 m=1

* NMOS differential pair.
* inp drives the first-stage output branch for non-inverting overall gain.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1

* PMOS current-mirror load.
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1
XPM stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1

* Common-source output stage with nominal 32-uA mirrored sink.
XPO out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XNO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=1.5 nf=1 m=1

* Miller compensation with series zero-control resistor.
RCOMP stage1 comp 6.8k
CCOMP comp out 0.9p

.ends dut
