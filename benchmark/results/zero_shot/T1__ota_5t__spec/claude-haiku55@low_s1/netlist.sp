.subckt dut iref inp inn out
* ---- Bias network (diode-connected devices; iref enters a drain, never a source) ----
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2 vb2 vb3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1

* Reference current injected into the drain/gate node of the diode-connected cascode NMOS
IREFSINK iref vb3 0

* ---- 5T OTA ----
* Tail current source mirrored from vb4
XMNT tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Input pair: inp drives the diode-side device, inn drives the output-side device
XMN2o net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1o out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS active load mirror
XMP1o net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMP0o out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
.ends dut
