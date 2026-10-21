.subckt dut iref inp inn out
* NMOS reference and mirrored tail/reference sinks
XNREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNPB   pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XTAIL  tail  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* PMOS bias branch and second-stage current source
XPPB   pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XP2    out   pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1.5 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XINP   ndp inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XINN   ndn inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XPLD   ndp ndp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1.5 nf=1 m=1
XPLM   ndn ndp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1.5 nf=1 m=1

* Second gain stage and Miller compensation
XOUTN  out ndn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
CCOMP  ndn ncomp 450f
RCOMP  ncomp out 10k
.ends dut
