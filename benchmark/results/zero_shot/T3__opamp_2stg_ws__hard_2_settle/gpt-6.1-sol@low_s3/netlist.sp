.subckt dut iref inp inn out

* Diode-connected reference; all amplifier bias currents are mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* Differential-stage tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=5

* NMOS differential pair with PMOS current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XINN ng inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XLOAD2 ng n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1

* Common-source output stage with mirrored current sink.
XOUTP out ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.2 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=10

* Series-R Miller compensation.
RCOMP ng nc 800
CCOMP nc out 1.8p

.ends dut
