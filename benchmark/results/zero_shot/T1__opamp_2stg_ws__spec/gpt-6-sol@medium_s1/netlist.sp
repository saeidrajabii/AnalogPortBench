.subckt dut iref inp inn out
* 20 uA reference and NMOS bias
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1

* PMOS mirror bias
XNPREF pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XPPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1

* NMOS cascode bias
XPCREF nbcas pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XNCREF nbcas nbcas nbstack 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XNSREF nbstack iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1

* Cascoded differential input stage; 60 uA nominal tail current
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.6 nf=1 m=1
XNINM dl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNINP dr inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNCASM pcl nbcas dl 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNCASP amp nbcas dr 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPPMIR pu pu vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.7 nf=1 m=1
XPPCAS pcl pcl pu vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.7 nf=1 m=1
XPPLOAD pur pu vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.7 nf=1 m=1
XPPCL amp pcl pur vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.7 nf=1 m=1

* Common-source output stage with a cascoded current sink
XPOUT out amp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XNCOUT out nbcas nsout 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XNSOUT nsout iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1

* Miller compensation with a series nulling resistor
RNULL amp comp 3k
CMILL comp out 700f
.ends dut
