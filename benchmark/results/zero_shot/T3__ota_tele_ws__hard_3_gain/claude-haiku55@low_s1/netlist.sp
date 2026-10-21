.subckt dut iref inp inn out
* ---- Bias generation (ideal 20 uA into iref) ----
* Diode-connected NMOS reference; its gate is the mirror line.
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail mirror, 2x reference -> 40 uA tail current.
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* Cascode gate bias: resistor from vdd into two stacked diode-connected NMOS.
Rcas vdd vbnc 20k
XMb1 vbnc vbnc midb 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMb2 midb midb 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- Input pair with NMOS cascodes ----
* Branch B (inn): input device, cascode, diode-connected PMOS load.
XMinB nBn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMcB nB vbnc nBn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMdB nB nB vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Branch A (inp): input device, cascode, output node.
XMinA nAn inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMcA out vbnc nAn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS mirror load driven from the diode node nB.
XMoA out nB vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
