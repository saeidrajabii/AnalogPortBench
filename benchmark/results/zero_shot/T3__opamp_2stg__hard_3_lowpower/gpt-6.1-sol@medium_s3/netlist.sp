.subckt dut iref inp inn out

* Reference-current mirror.
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=1

* Differential-pair tail current.
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28.5 L=2 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XMN1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMN2 nm inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP1 nm nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XMP2 n1 nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1

* Common-source output stage with mirrored current sink.
XMPO out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=57 L=2 nf=1 m=1

* Series-R Miller compensation.
RZ n1 nc 1.8k
CC nc out 850f

.ends dut
