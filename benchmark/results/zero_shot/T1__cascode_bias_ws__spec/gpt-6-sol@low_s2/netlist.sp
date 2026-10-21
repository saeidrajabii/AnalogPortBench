.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and mirror branches
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XNPREF vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XNPCAS vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1

* PMOS reference and mirror branches
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XPNCAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1

* Replica stacks generate the cascode-gate biases
XNNBOT nnrep iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XNNTOP vb3 vb3 nnrep 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XPPBOT pprep vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XPPTOP vb2 vb2 pprep vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1

* Output current source and sink
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.35 nf=1 m=1

* The input diode voltage is the NMOS sink bias.
RVB4 vb4 iin 1m
.ends dut
