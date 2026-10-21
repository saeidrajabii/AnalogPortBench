.subckt dut iref inp inn out
* Two-stage Miller OTA with NMOS differential pair, PMOS mirror load,
* PMOS common-source second stage, and NMOS current sinks mirrored from iref.
* Long channels (L = 1 um) are used for intrinsic gain.

* Bias reference: diode-connected NMOS carries the 20 uA iref current
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* Tail current source: 4x reference, 80 uA
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=4

* Input differential pair (inp on diode-load side, so n1 is non-inverting in inp)
XM1 nd inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2 n1 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS current-mirror load for first stage
XM3 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21 L=1 nf=1 m=1
XM4 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21 L=1 nf=1 m=1

* Second stage: PMOS common-source driven by n1, NMOS current sink (9x reference, 180 uA)
XM6 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=2
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=9

* Miller compensation with nulling resistor (RHP zero moved into LHP)
R1 n1 nz 3k
C1 nz out 500f
.ends dut
