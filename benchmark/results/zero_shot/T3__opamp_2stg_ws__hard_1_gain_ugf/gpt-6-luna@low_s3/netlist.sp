.subckt bias iref nb pb
* The reference current sets the NMOS mirror current.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* A mirrored sink biases the diode-connected PMOS.
XMPSINK pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
.ends bias

.subckt Opamp_2stg nb pb inp inn out
* NMOS differential pair with PMOS current-mirror load.
XMTAIL ntail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN1 nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN2 nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
* Common-source second stage.
XMNS out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XMPL out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1
* Miller compensation.
RCOMP nright ncomp 1k
CCOMP ncomp out 500f
.ends Opamp_2stg

.subckt dut iref inp inn out
XBIAS iref nb pb bias
XAMP nb pb inp inn out Opamp_2stg
.ends dut
