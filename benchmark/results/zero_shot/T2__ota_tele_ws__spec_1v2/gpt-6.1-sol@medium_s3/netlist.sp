* SKY130 low-voltage two-stage OTA.
* Sizing candidate; verify all specifications with the supplied TT models.
* Bias reference is mirrored; no reference current enters a source terminal.

.subckt dut iref inp inn out

* Reference mirror and differential-pair tail current.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=2 nf=1 m=1

* First stage: NMOS differential pair with PMOS mirror load.
XNINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNINP ng inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPLD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPLM ng nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Derive output-stage sink bias from the first-stage branch current.
XPBIAS nb nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XNBIAS nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1

* Second stage: PMOS common-source amplifier and mirrored NMOS sink.
XPOUT out ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XNOUT out nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=250 L=1 nf=1 m=1

* Series-zero Miller compensation.
RZ ng nc 820
CC nc out 2.2p

.ends dut
