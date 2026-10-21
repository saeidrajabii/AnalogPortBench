.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current enters the drain of a diode-connected NMOS.
* Its mirror biases a diode-connected PMOS; neither reference branch
* connects directly to out.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XNPBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Low-overdrive, long-channel output mirrors.
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Expose the mirror gate biases on all four bias ports.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
