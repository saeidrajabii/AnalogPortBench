.subckt dut iref inp inn out
* Bias: iref sinks 20 uA through a diode-connected NMOS (never into a source).
Mref  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
Mtail tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=6
Mbn   vbp  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
Mpd   vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
Mpg   vbnc vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
Mnd   vbnc vbnc 0   0   sky130_fd_pr__nfet_01v8_lvt W=1  L=0.5 nf=1 m=1

* Telescopic core with PMOS-mirror single-ended output.
* Left branch (inp) is diode-connected through the PMOS cascode at z1.
* Right branch (inn) drives out.
MPs1 pa  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=3
MPs2 pb  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=3
MPc1 z1  z1  pa  vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=3
MPc2 out z1  pb  vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=3
MNc1 z1  vbnc x1 0   sky130_fd_pr__nfet_01v8_lvt W=20   L=0.5 nf=1 m=3
MNc2 out vbnc x2 0   sky130_fd_pr__nfet_01v8_lvt W=20   L=0.5 nf=1 m=3
M1   x1  inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=24   L=0.5 nf=1 m=2
M2   x2  inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=24   L=0.5 nf=1 m=2
.ends dut
