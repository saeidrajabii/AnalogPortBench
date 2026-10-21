.subckt dut iref inp inn out
* Reference-current sink and 1:1 tail-current mirror
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Cascode-gate bias
RBIAS vdd vbcas 68k
XMBL vbmid vbmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMBU vbcas vbcas vbmid 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* NMOS differential pair; inp is on the diode-connected load side
XMNIN dleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMNINN dright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1

* NMOS cascodes
XMNC1 xleft vbc asleft 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMNC2 out vbc asright 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1

* PMOS current-mirror load
XMP1 xleft xleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1
XMP2 out xleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1

* Connect cascode sources to the differential-pair drains
RLEFT asleft dleft 1u
RRIGHT asright dright 1u
.ends dut
