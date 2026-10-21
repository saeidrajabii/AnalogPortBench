* Best-effort SKY130 1.2 V implementation: single-stage NMOS differential pair
* with a PMOS current-mirror load. Bias currents are derived from iref.
.subckt dut iref inp inn out
* Reference-current sink and NMOS current mirrors
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNLEFT nl inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNRIGHT out inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS reference branch and differential-pair active load
XMPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNSINK pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPLEFT nl pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPRIGHT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
