.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS diode-connected reference stack; iin current flows into its drain.
RIN iin vb3 1
XMN_REF_LO vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=20 nf=1 m=1
XMN_REF_HI vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=10000 L=20 nf=1 m=1

* PMOS diode-connected reference stack, biased by an NMOS current mirror.
XMN_PMREF vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=20 nf=1 m=1
XMP_REF_HI vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=20 nf=1 m=1
XMP_REF_LO vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=20 nf=1 m=1

* Cascode NMOS current sink
XMN_OUT_LO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=20 nf=1 m=1
XMN_OUT_HI out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=20 nf=1 m=1

* Cascode PMOS current source
XMP_OUT_HI psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=20 nf=1 m=1
XMP_OUT_LO out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=20 nf=1 m=1
.ends dut
