.subckt dut iref inp inn out
* Reference current is converted to an NMOS gate bias.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS bias branch and mirrored output-stage load.
XNPBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XPPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8.75 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XNINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XNINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPLEFT left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPRIGHT first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Common-source output stage and series-null Miller compensation.
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.35 nf=1 m=1
RNULL first comp 500
CMILL comp out 1.1p
.ends dut
