.subckt dut iref inp inn out
* Reference-current mirror
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1

* NMOS cascode-bias generator
XPBIAS nbcas pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XNBIAS1 nbcas nbcas nbstack 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XNBIAS2 nbstack iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XNPBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XPPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1

* Differential input stage with NMOS cascodes and a PMOS mirror load
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.6 nf=1 m=1
XNINM dl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNINP dr inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNCASM pcl nbcas dl 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNCASP amp nbcas dr 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPPMIR pcl pcl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.2 nf=1 m=1
XPPLOAD amp pcl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.2 nf=1 m=1

* Common-source output stage with a cascoded current sink
XPOUT out amp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XNCOUT out nbcas nsout 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XNSOUT nsout iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1

* Miller compensation
RNULL amp comp 5k
CMILL comp out 500f
.ends dut
